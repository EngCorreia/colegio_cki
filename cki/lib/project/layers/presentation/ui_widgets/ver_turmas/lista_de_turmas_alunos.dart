

import 'dart:developer';

import 'package:cki/project/layers/core/configuration/configuration.dart';
import 'package:cki/project/layers/core/show_toast_message/show_toast_message.dart';
import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../controllers/alunos_matriculados/alunos_matriculados_controller.dart';
import '../../controllers/listagem_de_turma_controller/listagem_de_turma_controller.dart';

class TurmasDosAlunos extends StatefulWidget {
  final String classeName;
  const TurmasDosAlunos({Key? key, required this.classeName}) : super(key: key);

  @override
  State<TurmasDosAlunos> createState() => _TurmasDosAlunosState();
}

class _TurmasDosAlunosState extends State<TurmasDosAlunos> {

  var lista = AlunosMatriculado();
  var  lerTurmas = Listagem();
  var idTurma;
  var turmaValue;

  @override
  void initState() {
    super.initState();
    lista.listaAlunosMatriculados(classe: widget.classeName);
    lerTurmas.leituraLista();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Turma da ${widget.classeName}",style: TextStyle(
            fontSize: 18,
            fontFamily: SettingsCki.segoeEui
        ),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Observer(builder: (_)=>
                Text("Qtd: ${lista.studenteList.length}",style: TextStyle(
                    fontFamily: SettingsCki.segoeEui,
                    fontSize: 18
                ),))),
          ),

        ],
      ),
      body: Observer(
        builder: (_)=> (lista.studenteList.isNotEmpty) ? Column(
          children: [

            Expanded(
              child: ListView.builder(
                  itemCount: lista.studenteList.length,
                  itemBuilder: (context,index)=> ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      // backgroundColor: Colors.transparent,
                      child: Image.asset("assets/images/image.png"),
                    ),
                    title: Text("${lista.studenteList[index].studentName}",style: TextStyle(
                      fontFamily: SettingsCki.segoeEui,
                      color: Colors.blue[900],
                      fontSize: 18
                    ),),
                    subtitle: Text("${lista.studenteList[index].turmaAluno ?? "Aluno sem sala"}",style: TextStyle(
                        fontFamily: SettingsCki.segoeEui,
                    ),),
                   // trailing: const Icon(Icons.edit,color: Colors.blue,),
                  )),
            ),
          ],
        ) : const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.graduationCap,size: 100,color: Colors.grey,),
              SizedBox(
                height: 20,
              ),

              Text("Não existe aluno Matriculado nesta classe",style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16
              ),),
            ],
          ),
        ),

      ),
    );
  }
}
