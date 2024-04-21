import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../core/const_strings/user_information.dart';
import '../../core/show_toast_message/show_toast_message.dart';

class AuthenticationServe extends ChangeNotifier{

  Future<bool> login({required String phoneNumber}) async{
    try{
      var checkStudent = await FirebaseFirestore.instance.collection("student").where("phoneNumber",isEqualTo: phoneNumber).get();
      var ss = checkStudent.docs;
      if(ss.isEmpty){
        ShowToast.show_error("Não existe nenhum registo com este NUMERO ( $phoneNumber )");
        return false;
      }else{
        var json = ss.last.data();
        Map<String,dynamic> user = {
          "nome": json["nome"], "phone": json["phoneNumber"], "email": json["email"],
          "uuid": ss.last.id, "status": 1
        };

        final pref = await SharedPreferences.getInstance();
        var response = pref.get("auth");
        if(response != null){
          pref.remove("auth");
          pref.setString("auth", jsonEncode(user));
          var response = await updateStudent(json: user);
          if(response == true){
            ShowToast.show_message_Success("Usuario logado com sucesso");
          }else{
            ShowToast.show_error("Ocorreu um erro na criação da conta");
          }

        }else{
          pref.setString("auth", jsonEncode(user));
          await updateStudent(json: user);
          ShowToast.show_message_Success("Usuario logado com sucesso");
        }
      }
      return true;
    }catch(e){
      ShowToast.show_error("Problema na conexão com o servidor");
      return false;
    }

  }



  Future<bool> createAccount({required String userName,required String phoneNumber,required String email}) async{
     var uuid = const Uuid();
    Map<String,dynamic> user = {
      "nome": userName, "phone": phoneNumber, "email": email,
      "uuid": uuid.v4(), "status": 1
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


  Future<bool> updateStudent({required Map<String,dynamic> json}) async{
    try{
      var checkStudent = await FirebaseFirestore.instance.collection("student").doc(json["uuid"]).get();
      if(checkStudent.exists){
        var updateStudent = FirebaseFirestore.instance.collection("student").doc(json["uuid"]);
        Map<String,dynamic> student = {
          "photo": StudentInformation.photo,
          //"admin": 0,
          "status": json["status"],
        };
        updateStudent.update(student).whenComplete((){
          StudentInformation.name = json["nome"];
          StudentInformation.userID = json["uuid"];
          StudentInformation.phoneNumber = json["phone"];
          StudentInformation.photo = "";
          StudentInformation.status = json["status"];
          // StudentInformation.status = json["status"];
          notifyListeners();
        });
      }else{
        var updateStudent = FirebaseFirestore.instance.collection("student").doc(json["uuid"]);
        Map<String,dynamic> student = {
          "nome": json["nome"],
          "userID": json["uuid"],
          "photo": StudentInformation.photo,
          "phoneNumber": json["phone"],
          "email": json["email"] ?? "",
          "admin": 0,
          "status": json["status"],
        };
        updateStudent.set(student).whenComplete((){
          StudentInformation.name = json["nome"];
          StudentInformation.userID = json["uuid"];
          StudentInformation.phoneNumber = json["phone"];
          StudentInformation.photo = "";
          StudentInformation.status = json["status"];
          // StudentInformation.status = json["status"];
          notifyListeners();

        });

      }
      return true;
    }catch(e){
      ShowToast.show_error("error de conexão $e");
      return false;
    }
  }



  Future<bool> setLoginState(int value) async{
    final pref = await SharedPreferences.getInstance();
    var result = await pref.setInt("state", value);
    StudentInformation.screenState = value;
    notifyListeners();
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
      StudentInformation.name = json["nome"];
      StudentInformation.userID = json["uuid"];
      StudentInformation.phoneNumber = json["phone"];
      StudentInformation.photo = "";
      StudentInformation.status = json["status"];
      notifyListeners();

    }else{
      setLoginState(0);
      StudentInformation.status = 0;
      notifyListeners();
    }
  }


  Future<void> logOut() async{
    final pref = await SharedPreferences.getInstance();
    var result = pref.get("auth");
    if(result != null && StudentInformation.userID!.isNotEmpty){
      Map<String,dynamic> json = jsonDecode(result.toString());
      Map<String,dynamic> user = {
        "nome": json["nome"], "phone": json["phone"], "email": json["email"],
        "uuid": json["uuid"], "status": 0
      };
      log("_______________UUID LogOut ${user["uuid"]}");
      await updateStudent(json: user);
      final pref = await SharedPreferences.getInstance();
      pref.setString("auth", jsonEncode(user));

      StudentInformation.name = json["nome"];
      StudentInformation.userID = json["uuid"];
      StudentInformation.phoneNumber = json["phone"];
      StudentInformation.photo = "";
      StudentInformation.status = 0;
      StudentInformation.screenState = 0;
      Future.delayed(const Duration(seconds: 3),(){
        setLoginState(0);
        notifyListeners();
      });

    }else{
      setLoginState(0);
      StudentInformation.status = 0;
      notifyListeners();
    }
  }
}