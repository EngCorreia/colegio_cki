import 'package:cki/project/layers/core/show_toast_message/show_toast_message.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/configuration/configuration.dart';
import '../../../../../../core/const_strings/user_information.dart';
import '../../../../../../domain/entities/courses_entity/coures_entitiy.dart';
import '../../../../../controllers/verificar_aluno_matriculado/verificar_aluno.dart';
import '../../../constants.dart';
import 'chat_and_add_to_cart.dart';
import 'list_of_colors.dart';
import 'product_image.dart';

class BodyDetailCourse extends StatefulWidget {
  final Course coures;
  const BodyDetailCourse({Key? key, required this.coures}) : super(key: key);

  @override
  State<BodyDetailCourse> createState() => _BodyDetailCourseState();
}

class _BodyDetailCourseState extends State<BodyDetailCourse> {
  var verificacao = VerificarAlunosMatriculado();
  @override
  void initState() {
    super.initState();
    verificacao.verificarAlunosMatriculados(classe: "1º_classe");
  }
  @override
  Widget build(BuildContext context) {
    // it provide us total height and width
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small devices
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              decoration: const BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Hero(
                      tag: '${widget.coures.id}',
                      child: ProductPoster(
                        size: size,
                        image:widget.coures.images!,
                      ),
                    ),
                  ),
                  const ListOfColors(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: kDefaultPadding / 2),
                    child: Text(widget.coures.classeName!,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Text(
                    '${widget.coures.prices} Kzs Inscrição',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: kSecondaryColor,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                    child: Text(widget.coures.description!,
                      style: const TextStyle(color: kTextLightColor),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding),
                ],
              ),
            ),
            //Observer(builder: (_) => verificacao.isStudent == true ? myButton():
            NewStudentButton(studentClass: widget.coures.classeName!),

          ],
        ),
      ),
    );
  }

  myButton(){
    return GestureDetector(
      onTap: (){
        ShowToast.show_error("Este aluno já foi matriculado");
      },
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
          child: Center(child: Text("O Aluno ${StudentInformation.name} já esta matriculado",style: TextStyle(
              color: Colors.white,
              fontFamily: SettingsCki.segoeEui,
              fontWeight: FontWeight.bold,
              fontSize: 14
          ),)),
        ),
      ),
    );
  }
}
