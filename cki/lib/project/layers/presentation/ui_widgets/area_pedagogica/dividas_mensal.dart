
import 'package:cki/project/layers/core/configuration/configuration.dart';
import 'package:cki/project/layers/core/show_toast_message/show_toast_message.dart';
import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../controllers/alunos_matriculados/alunos_matriculados_controller.dart';
import '../../controllers/listagem_de_turma_controller/listagem_de_turma_controller.dart';
import 'cobrar_mensalidade_ui.dart';

class DividasMensal extends StatefulWidget {
  final String classeName;
  const DividasMensal({Key? key, required this.classeName}) : super(key: key);

  @override
  State<DividasMensal> createState() => _DividasMensalState();
}

class _DividasMensalState extends State<DividasMensal> {

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
        backgroundColor: Colors.green,
        title: Text("Alunos da ${widget.classeName}",style: TextStyle(
            fontSize: 16,
            fontFamily: SettingsCki.segoeEui,
            color: Colors.white,
            fontWeight: FontWeight.bold
        ),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Observer(builder: (_)=>
                Text("Qtd: ${lista.studenteList.length}",style: TextStyle(
                    fontFamily: SettingsCki.segoeEui,
                    fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),))),
          ),

          GestureDetector(
            onTap: (){
              if(lista.studenteList.isEmpty){
                ShowToast.show_error("Não existe alunos matriculas neste classe");
              }else{
                lista.adicionarTurmasAlunosMatriculados(classe: widget.classeName,turmaValue: turmaValue,listaDeAluno: lista.studenteList,
                    turmaId: idTurma.first.id);
              }
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.repeat_one_on_sharp,color: Colors.white,size: 30,),
            ),
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
                        turmaValue = nivel;
                        var d = nivel.toString().split(" ");
                        idTurma = lerTurmas.turmaList.where((element) => element.periodo == d[4] && element.sala == int.parse(d[3]));
                      },
                      required: false,
                      hintText: "Seleciona o mes",
                      items: mes.map((element) => element).toList(),
                    )
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: lista.studenteList.length,
                  itemBuilder: (context,index)=> ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                        CobrancaMensalidade(
                          studentName: lista.studenteList[index].studentName!,
                        idAluno: lista.studenteList[index].id!,
                        fatherId: lista.studenteList[index].assignedTo!,
                      )));

                    },
                    leading: CircleAvatar(
                      // backgroundColor: Colors.transparent,
                      child: Image.asset("assets/images/image.png"),
                    ),
                    title: Text("${lista.studenteList[index].studentName}"),
                    subtitle: Text("${lista.studenteList[index].turmaAluno ?? "Aluno sem sala"}"),
                    trailing:lista.studenteList[index].status == 0 ? const Icon(Icons.info_outline_rounded,color: Colors.red,):
                    const Icon(FontAwesomeIcons.checkCircle,color: Colors.green,),
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

  List<String> mes = ["janeiro","fevereiro","março","abril","maio","junho","julho","agosto","setembro","outubro","novembro","dezembro"];
}
