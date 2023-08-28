
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/const_strings/user_information.dart';

class UpdateStudentInformation{

  Future<void> updateStudent({required String classe}) async{
    try{
      var updateStudent = FirebaseFirestore.instance.collection("student").doc(StudentInformation.userID);
      Map<String,dynamic> student = {
        "nome": "",
        "userID": "",
        "photo": "",
        "phoneNumber": "",
      };

      updateStudent.update(student);
    }catch(e){

    }
  }

}