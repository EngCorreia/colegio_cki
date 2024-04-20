import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../core/const_strings/user_information.dart';
import '../../core/show_toast_message/show_toast_message.dart';

class AuthenticationServe extends ChangeNotifier{

  Future<bool> login(BuildContext context) async{
    final pref = await SharedPreferences.getInstance();
    var resultSet =  pref.get("auth");
    if(resultSet != null){
      Map<String,dynamic> json = jsonDecode(resultSet.toString());
      StudentInformation.name = json["name"];
      StudentInformation.userID = "";
      StudentInformation.phoneNumber = json["phone"];
      StudentInformation.photo = "";
    }
    return true;
  }



  Future<bool> createAccount({required String userName,required String phoneNumber,required String email}) async{
     var uuid = const Uuid();
    Map<String,dynamic> user = {
      "name": userName, "phone": phoneNumber, "email": email,
      "uuid": uuid.v4(), "status": 0
    };

    log("_______________ ${user["uuid"]}");
    final pref = await SharedPreferences.getInstance();
    pref.setString("auth", jsonEncode(user));
    await updateStudent(json: user);
    var resultSet =  pref.get("auth");
    notifyListeners();
    if(resultSet != null){
      return true;
    }else{
      return false;
    }
  }


  Future<void> updateStudent({required Map<String,dynamic> json}) async{
    try{
      var checkStudent = await FirebaseFirestore.instance.collection("student").doc(json["uuid"]).get();
      if(checkStudent.exists){
        // ShowToast.show_error("existe");
      }else{
        var updateStudent = FirebaseFirestore.instance.collection("student").doc(json["uuid"]);
        Map<String,dynamic> student = {
          "nome": json["name"],
          "userID": json["uuid"],
          "photo": StudentInformation.photo,
          "phoneNumber": json["phone"],
          "email": json["email"] ?? "",
          "admin": 0,
        };
        updateStudent.set(student).whenComplete((){
          StudentInformation.name = json["name"];
          StudentInformation.userID = json["uuid"];
          StudentInformation.phoneNumber = json["phone"];
          StudentInformation.photo = "";
          StudentInformation.status = json["status"];
          // StudentInformation.status = json["status"];
          notifyListeners();
        });
      }

    }catch(e){
      ShowToast.show_error("error de conexão");
    }
  }



  Future<bool> setLoginState(int value) async{
    final pref = await SharedPreferences.getInstance();
    var result = await pref.setInt("state", value);
    StudentInformation.screenState = value;
    //notifyListeners();
    return result;
  }

  Future<int> getLoginState() async{
    final pref = await SharedPreferences.getInstance();
    var result = pref.getInt("state");
    return result ?? 2;
  }

  Future<void> startUpUser() async{
    final pref = await SharedPreferences.getInstance();
    var result = pref.get("auth");
    if(result != null){

      Map<String,dynamic> json = jsonDecode(result.toString());
      StudentInformation.name = json["name"];
      StudentInformation.userID = json["uuid"];
      StudentInformation.phoneNumber = json["phone"];
      StudentInformation.photo = "";
      StudentInformation.status = json["status"];
      notifyListeners();

    }else{
      StudentInformation.userID = "";
      notifyListeners();
    }
  }


  Future<void> logOut() async{
    final pref = await SharedPreferences.getInstance();
    var result = pref.get("auth");
    if(result != null && StudentInformation.userID!.isNotEmpty){
      Map<String,dynamic> json = jsonDecode(result.toString());
      Map<String,dynamic> user = {
        "name": json["name"], "phone": json["phone"], "email": json["email"],
        "uuid": "", "status": json["status"]
      };
      log("_______________UUID LogOut ${user["uuid"]}");
      final pref = await SharedPreferences.getInstance();
      pref.setString("auth", jsonEncode(user));

      StudentInformation.name = json["name"];
      StudentInformation.userID = "";
      StudentInformation.phoneNumber = json["phone"];
      StudentInformation.photo = "";
      StudentInformation.status = json["status"];
      StudentInformation.screenState = 0;
      setLoginState(0);
      notifyListeners();
    }else{
      setLoginState(0);
      StudentInformation.userID = "";
      notifyListeners();
    }
  }
}