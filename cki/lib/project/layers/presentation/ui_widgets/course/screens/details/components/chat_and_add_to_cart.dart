import 'package:cki/project/layers/core/configuration/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../nova_matricula/new_student.dart';
import '../../../constants.dart';

class NewStudentButton extends StatelessWidget {
  const NewStudentButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const NewStudent())),
      child: Center(
        child: Container(
          height: 50,
          margin: const EdgeInsets.all(kDefaultPadding),
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding / 2,
          ),
          decoration: BoxDecoration(
            color: Color(0xFFFCBF1E),
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
