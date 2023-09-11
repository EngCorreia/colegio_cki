
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/configuration/configuration.dart';
import '../../../domain/entities/lista_turma_entity/lista_turma_entity.dart';
import '../../controllers/listagem_de_turma_controller/listagem_de_turma_controller.dart';

class ListagemDeTurmas extends StatefulWidget {
  const ListagemDeTurmas({Key? key}) : super(key: key);

  @override
  State<ListagemDeTurmas> createState() => _ListagemDeTurmasState();
}

class _ListagemDeTurmasState extends State<ListagemDeTurmas> {

  var  lerTurmas = Listagem();

  @override
  void initState() {
    super.initState();
    lerTurmas.leituraLista();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Lista das turmas"),
      ),

      body: Observer(
        builder: (_)=>ListView.builder(
            itemCount: lerTurmas.turmaList.length,
            itemBuilder: (context,index){
              var turm = lerTurmas.turmaList[index];
              return turmas(turmaEntity:  turm);
            }
        ),
      )

    );
  }


  Widget turmas({required TurmaEntity turmaEntity}){
    return  GestureDetector(
      //onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> const Teachers())),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 160,
          decoration: BoxDecoration(
            color: Colors.white,
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
              const SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  // backgroundColor: Colors.transparent,
                  child: Image.asset("assets/images/image.png"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${turmaEntity.classe}  Classe  ${turmaEntity.periodo}",style: TextStyle(
                    fontFamily: SettingsCki.segoeEui,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8,bottom: 8),
                child: Text("Nome da turma: ${turmaEntity.nome}",style: TextStyle(
                    fontFamily: SettingsCki.segoeEui,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8,bottom: 8),
                child: Text("Sala: ${turmaEntity.sala}",style: TextStyle(
                    fontFamily: SettingsCki.segoeEui,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
