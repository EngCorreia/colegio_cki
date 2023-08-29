
import 'dart:developer';

import 'package:cki/project/layers/core/show_toast_message/show_toast_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/const_strings/user_information.dart';

class UpdateStudentInformation{

  Future<void> updateStudent({String? userId}) async{
    try{
      var checkStudent = await FirebaseFirestore.instance.collection("student").doc(userId).get();
      if(checkStudent.exists){
        ShowToast.show_error("existe");
      }else{
        var updateStudent = FirebaseFirestore.instance.collection("student").doc(userId);
        Map<String,dynamic> student = {
          "nome": StudentInformation.name,
          "userID": StudentInformation.userID,
          "photo": StudentInformation.photo,
          "phoneNumber": StudentInformation.phoneNumber,
        };
         updateStudent.set(student);
      }

    }catch(e){
     ShowToast.show_error("error de conexão");
    }
  }

}