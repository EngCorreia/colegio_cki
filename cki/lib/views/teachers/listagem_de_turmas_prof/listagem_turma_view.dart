
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../project/layers/core/configuration/configuration.dart';
import '../../../project/layers/presentation/ui_widgets/datesheet_screen/data/constList.dart';
import '../listagem_de_alunos/listagem_alunos_view.dart';
import 'listagem_turma_view_model.dart';



class ListTeacherClassView extends StatelessWidget {

  const ListTeacherClassView({super.key});

  @override
  Widget build(BuildContext context) {
    buildSheet() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
              const TeacherClassStudentView(trimestre: 'primeiro_trimestre',)));
            },
            leading: ClipOval(
              child: Image.asset(
                "assets/images/colegio.png",
                width: 40,
                height: 40,
              ),
            ),
            title: Text(
              "Primeiro trimestre",
              style: TextStyle(
                  fontFamily: SettingsCki.segoeEui,
                  color: Colors.blue[900],
                  fontWeight: FontWeight.w900,
                  fontSize: 18),
            ),

          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
              const TeacherClassStudentView(trimestre: 'segundo_trimestre',)));
            },
            leading: ClipOval(
              child:Image.asset(
                "assets/images/colegio.png",
                width: 40,
                height: 40,
              ),
            ),
            title: Text(
              "Segundo trimestre",
              style: TextStyle(
                  fontFamily: SettingsCki.segoeEui,
                  color: Colors.blue[900],
                  fontWeight: FontWeight.w900,
                  fontSize: 18),
            ),

          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
              const TeacherClassStudentView(trimestre: 'terceiro_trimestre',)));
            },
            leading: ClipOval(
              child: Image.asset(
                "assets/images/colegio.png",
                width: 40,
                height: 40,
              ),
            ),
            title: Text(
              "Terceiro trimestre",
              style: TextStyle(
                  fontFamily: SettingsCki.segoeEui,
                  color: Colors.blue[900],
                  fontWeight: FontWeight.w900,
                  fontSize: 18),
            ),

          ),
        ],
      );
    }
    return ViewModelBuilder<ListClassViewModel>.reactive(
        viewModelBuilder: ()=> ListClassViewModel(),
        onViewModelReady: (model) async {
          await model.getTeacherClass();
        },
        builder: (context,model,child){
          return Scaffold(
            appBar: AppBar(
              title: const Text("Minhas turmas"),
            ),
            body:  ListView.builder(
                itemCount: model.listTeacher.length,
                 itemBuilder: (context,index)=>
                     InkWell(
                       onTap: (){
                         showModalBottomSheet(
                             context: context,
                             shape: const RoundedRectangleBorder(
                                 borderRadius: BorderRadius.vertical(
                                     top: Radius.circular(20))),
                             builder: (context) => buildSheet());
                       },
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Container(
                           padding: const EdgeInsets.all(kDefaultPadding),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(kDefaultPadding),
                             color: kOtherColor,
                             boxShadow: const [
                               BoxShadow(
                                 color: kTextLightColor,
                                 blurRadius: 2.0,
                               ),
                             ],
                           ),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text("Classe:  ${model.listTeacher[index].classe}"),
                               Text("Nome da sala:  ${model.listTeacher[index].name}"),
                               Text("Periodo: ${model.listTeacher[index].periodo}"),
                               Text("Sala Nª: ${model.listTeacher[index].sala}"),

                             ],
                           ),
                         ),
                       ),
                     ),
                ),


          );
        });
  }


}
