import 'package:asuka/asuka.dart';
import 'package:cki/project/layers/core/configuration/configuration.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/const_strings/user_information.dart';
import '../../../../../../domain/entities/student_entity/student_data_entity.dart';
import '../../../../../../domain/usecases/login_usecase/login_usecase.dart';
import '../../../../login_ui/registerscreen.dart';
import '../../../../nova_matricula/new_student.dart';
import '../../../constants.dart';

class NewStudentButton extends StatelessWidget {
  final String studentClass;
  const NewStudentButton({
    Key? key, required this.studentClass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => StudentInformation.status != 0 ? Navigator.push(context, MaterialPageRoute(builder: (context)=> NewStudent(
          studentClass: studentClass,
          studentDataEntity: StudentDataEntity(),
      ))) :  Asuka.showDialog(
        builder: (context) => AlertDialog(
          title: Text("Aviso ...",style: TextStyle(
              color: Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: SettingsCki.segoeEui
          ),),
          content: Text("Caro encarregado, Por favor faça LOGIN na sua conta ou CRIA uma nova conta para efectuar sua inscrição",style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              fontFamily: SettingsCki.segoeEui
          )),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegisterScreen()));
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      ),
      child: Center(
        child: Container(
          height: 50,
          margin: const EdgeInsets.all(kDefaultPadding),
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding / 2,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFFCBF1E),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(child: Text("Faça agora sua inscrição",style: TextStyle(
            color: Colors.white,
            fontFamily: SettingsCki.segoeEui,
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),)),
        ),
      ),
    );
  }
}
