

import 'dart:developer';

import 'package:cki/project/layers/core/configuration/configuration.dart';
import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../controllers/alunos_matriculados/alunos_matriculados_controller.dart';
import '../../controllers/listagem_de_turma_controller/listagem_de_turma_controller.dart';

class AlunosMatriculados extends StatefulWidget {
  final String classeName;
  const AlunosMatriculados({Key? key, required this.classeName}) : super(key: key);

  @override
  State<AlunosMatriculados> createState() => _AlunosMatriculadosState();
}

class _AlunosMatriculadosState extends State<AlunosMatriculados> {

  var lista = AlunosMatriculado();
  var  lerTurmas = Listagem();

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
        title: Text("Alunos da ${widget.classeName}",style: TextStyle(
          fontSize: 14,
          fontFamily: SettingsCki.segoeEui
        ),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Observer(builder: (_)=>
                Text("Qtd: ${lista.studenteList.length}",style: TextStyle(
                  fontFamily: SettingsCki.segoeEui,
                  fontSize: 15
                ),))),
          ),

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.repeat_one_on_sharp,color: Colors.blue,size: 30,),
          )
        ],
      ),
      body: Observer(
        builder: (_)=> (lista.studenteList.isNotEmpty) ? Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8,left: 8, bottom: 10,top: 10),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 3,
                      )
                    ]),
                child: Padding(
                    padding: const EdgeInsets.only(right: 0,left: 0,
                        bottom: 0),
                    child: DropDownField(
                      textStyle: TextStyle(color: Colors.black54,fontFamily: SettingsCki.segoeEui,fontSize: 16),
                      labelStyle:  TextStyle(color: Colors.black,fontFamily: SettingsCki.segoeEui,fontSize: 16),
                      onValueChanged: (dynamic value){
                        String? nivel = value.toString();
                        var d = nivel.toString().split(" ");
                        var id = lerTurmas.turmaList.where((element) => element.periodo == d[4] && element.sala == int.parse(d[3]));
                        log("*****************+ ${id.first.id}");
                      },
                      required: false,
                      hintText: "Atribuição de turmas",
                      items: lerTurmas.turmaList.map((element) => "${element.nome.toString()} Sala nª: ${element.sala.toString()} ${element.periodo.toString()}").toList(),
                    )
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: lista.studenteList.length,
                  itemBuilder: (context,index)=> ListTile(
                    leading: CircleAvatar(
                      // backgroundColor: Colors.transparent,
                      child: Image.asset("assets/images/image.png"),
                    ),
                    title: Text("${lista.studenteList[index].studentName}"),
                    subtitle: Text("${lista.studenteList[index].phoneNumberFather}   ( Sem Sala )"),
                    trailing: const Icon(Icons.edit,color: Colors.blue,),
                  )),
            ),
          ],
        ) : Center(
              child: Container(
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
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

      ),
    );
  }
}
