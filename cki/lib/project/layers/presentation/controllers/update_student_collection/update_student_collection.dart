
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/const_strings/user_information.dart';

class UpdateStudentInformation{

  Future<void> updateStudent({required String userId}) async{
    try{

      var updateStudent = FirebaseFirestore.instance.collection("student").doc(userId);
      Map<String,dynamic> student = {
        "nome": StudentInformation.name,
        "userID": StudentInformation.userID,
        "photo": StudentInformation.photo,
        "phoneNumber": StudentInformation.phoneNumber,
      };

      updateStudent.update(student);
    }catch(e){

    }
  }

}