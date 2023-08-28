

import 'package:cki/project/layers/core/configuration/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../controllers/alunos_matriculados/alunos_matriculados_controller.dart';

class AlunosMatriculados extends StatefulWidget {
  final String classeName;
  const AlunosMatriculados({Key? key, required this.classeName}) : super(key: key);

  @override
  State<AlunosMatriculados> createState() => _AlunosMatriculadosState();
}

class _AlunosMatriculadosState extends State<AlunosMatriculados> {

  var lista = AlunosMatriculado();

  @override
  void initState() {
    super.initState();
    lista.listaAlunosMatriculados(classe: widget.classeName);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Alunos matriculado"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Observer(builder: (_)=>
                Text("${lista.studenteList.length}",style: TextStyle(
                  fontFamily: SettingsCki.segoeEui,
                  fontSize: 18
                ),))),
          )
        ],
      ),
      body: Observer(
        builder: (_)=> ListView.builder(
            itemCount: lista.studenteList.length,
            itemBuilder: (context,index)=>ListTile(
              leading: CircleAvatar(
                // backgroundColor: Colors.transparent,
                child: Image.asset("assets/images/image.png"),
              ),
              title: Text("${lista.studenteList[index].studentName}"),
              subtitle: Text("${lista.studenteList[index].phoneNumberFather}"),
              trailing: const Icon(Icons.edit,color: Colors.green,),
            )),
      ),
    );
  }
}
