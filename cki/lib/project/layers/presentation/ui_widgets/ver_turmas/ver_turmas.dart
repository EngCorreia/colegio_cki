import 'dart:developer';

import 'package:cki/project/layers/core/configuration/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../controllers/financa_aluno_controller/financa_alunos_controller.dart';
import '../money_student/money_student.dart';
import 'lista_de_turmas_alunos.dart';

class ListaDeTurmas extends StatefulWidget {
  const ListaDeTurmas({super.key});

  @override
  State<ListaDeTurmas> createState() =>  _ListaDeTurmasState();
}

class _ListaDeTurmasState extends State<ListaDeTurmas> {

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
          title: Text("Turmas por classe",style: TextStyle(
              color: Colors.white,
              fontFamily: SettingsCki.segoeEui,
              fontSize: 18
          )),

          actions: [

            Observer(builder: (_)=>Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text("${financa.list.length} Filho(s)",style: TextStyle(
                  fontFamily: SettingsCki.segoeEui,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),),
            ),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                child: Image.asset("assets/images/image.png"),
              ),
            )
          ],


        ),

        body: Observer(
          builder: (_)=>Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: financa.list.length,
                    itemBuilder: (context,index) => turmas(
                      index: index,
                      turmas: financa.list
                    ),
                ),
              ),
            ],
          ),
        )

    );
  }

  Widget turmas({required List<dynamic> turmas, required int index}){
    return  GestureDetector(
      onTap: (){
        var classe = turmas[index]["classe"].toString();
        Navigator.push(context, MaterialPageRoute(builder: (context)=> TurmasDosAlunos(
          classeName: classe,
        )));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 160,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 1,
                spreadRadius: 1,
                // offset: const Offset(2, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8,top: 8,right: 8),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Image.asset("assets/images/image.png"),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 8,top: 8,right: 8),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 30,
                      backgroundImage: AssetImage("assets/classRoom/class_room2.jpeg"),
                    ),
                  ),
                ],
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Nome: ${turmas[index]["nomeAluno"]}",style: TextStyle(
                    fontFamily: SettingsCki.segoeEui,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  fontSize: 18
                ),),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8,bottom: 8),
                child: Text("Classe: ${turmas[index]["classe"]}",style: TextStyle(
                    fontFamily: SettingsCki.segoeEui,
                    fontWeight: FontWeight.normal,
                    color: Colors.white
                ),),
              ),

              /*Padding(
                padding: const EdgeInsets.only(left: 8,right: 8,bottom: 8),
                child: Text("Sala: ",style: TextStyle(
                    fontFamily: SettingsCki.segoeEui,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),),
              ),
              */

            ],
          ),
        ),
      ),
    );
  }
}
