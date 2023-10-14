import 'dart:developer';

import 'package:cki/project/layers/core/configuration/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/financa_aluno_controller/financa_alunos_controller.dart';
import '../money_student/money_student.dart';
import 'estatistica_aluno.dart';

class FinancasAluno extends StatefulWidget {
  const FinancasAluno({super.key});

  @override
  State<FinancasAluno> createState() => _FinancasAlunoState();
}

class _FinancasAlunoState extends State<FinancasAluno> {

  var financa = AreaFinanceiraAluno();
  
  @override
  void initState() {
    super.initState();
    financa.leituraFilhosFinancas();

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        elevation: 0,
        title: Text("Área Financeira",style: TextStyle(
            color: Colors.white,
            fontFamily: SettingsCki.segoeEui,
            fontSize: 18
        )),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: const Icon(FontAwesomeIcons.graduationCap,color: Colors.black),
          ),
        ),
        actions: [
          /* Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(FontAwesomeIcons.moneyBillAlt,color: Colors.green,size: 30,),
          ),*/
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              // backgroundColor: Colors.transparent,
              child: Image.asset("assets/images/image.png"),
            ),
          )
        ],


      ),
      
      body: Observer(
        builder: (_)=>Column(
          children: [

            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Colors.orange[400],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.people),
                    Text("${financa.list.length} Filho(s)",style: TextStyle(
                        fontFamily: SettingsCki.segoeEui,
                        fontSize: 18,
                        fontWeight: FontWeight.normal
                    ),),

                    Text("Fale conosco ligando",style: TextStyle(
                        fontFamily: SettingsCki.segoeEui,
                        fontSize: 18,
                        fontWeight: FontWeight.normal
                    ),),

                    GestureDetector(
                      onTap: () {
                        customLaunch('+2449516528575');
                        },
                        child: const Icon(Icons.call,color: Colors.cyanAccent,size: 30,)),
                  ],
                ),

              ),
            ),

            Expanded(
              child: ListView.builder(
                  itemCount: financa.list.length,
                  itemBuilder: (context,index) => ListTile(
                    onTap: (){
                      var studentId = financa.list[index]["idAluno"];

                     /* Navigator.push(context, MaterialPageRoute(builder: (context)=>  MoneyStudent(
                        idAluno: studentId,
                        studentName: financa.list[index]["nomeAluno"],
                      )));

                      */

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>  AlunoEstisticaFinancas(
                        idAluno: studentId,
                        studentName: financa.list[index]["nomeAluno"],
                      )));




                    },
                    leading: CircleAvatar(
                      // backgroundColor: Colors.transparent,
                      child: Image.asset("assets/images/image.png"),
                    ),
                    title: Text("${financa.list[index]["nomeAluno"]}",style: TextStyle(
                      fontFamily: SettingsCki.segoeEui,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black
                    ),),
                    subtitle: Text("${financa.list[index]["classe"]}",style: TextStyle(
                        fontFamily: SettingsCki.segoeEui,
                        fontWeight: FontWeight.normal,
                        color: Colors.lightBlueAccent
                    ),),
                  )
              ),
            ),
          ],
        ),
      )

    );
  }

  void customLaunch(command) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: command,
    );
    await launchUrl(launchUri);
  }

}
