
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

import '../../../core/const_strings/user_information.dart';
import '../../../core/show_toast_message/show_toast_message.dart';
import '../../../domain/entities/logim_param/login_param.dart';
import '../../../domain/usecases/login_usecase/login_usecase.dart';

part 'controller_login.g.dart';

class LoginControl = _NewUser with _$LoginControl;
abstract class _NewUser with Store{

  @observable
  int? status;

  @computed
  int? get newStatusUser => status;

  Future loginUserStatus() async {
    var updateStudent = FirebaseFirestore.instance.collection("student").doc(StudentInformation.userID).snapshots();
    updateStudent.listen((event) {
      if(event.exists){
        Map<String,dynamic>? statusUser = event.data();
        if(statusUser != null){
          status = statusUser["admin"] ?? 0;
        }
      }
    });
  }
}