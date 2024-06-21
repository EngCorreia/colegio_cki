import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import '../../../project/layers/core/configuration/configuration.dart';
import '../../../project/layers/presentation/ui_widgets/calendary_screen/widgets/assignment_widgets.dart';
import '../../../project/layers/presentation/ui_widgets/datesheet_screen/data/constList.dart';
import 'listagem_alunos_view_model.dart';


class TeacherClassStudentView extends HookWidget {

  final String trimestre;
  const TeacherClassStudentView({super.key, required this.trimestre});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final note1 = useTextEditingController();
    final note2 = useTextEditingController();
    final note3 = useTextEditingController();
    return ViewModelBuilder<TeacherClassStudentViewModel>.reactive(
        viewModelBuilder: ()=> TeacherClassStudentViewModel(trimestre),
        onViewModelReady: (model) async {
          await model.getTeacherClass();
          await model.lerDisciplinas();
        },
        builder: (context,model,child){
          return Scaffold(
            appBar: AppBar(
              title: const Text("Minha turma"),
            ),
            body:  Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Container(
                    height: 48,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.1),
                              blurRadius: 15,
                              offset: const Offset(0.0, 0.0))
                        ]),
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      value: model.values,
                      borderRadius: BorderRadius.circular(15),
                      onChanged: (data) {
                          model.setValue(data.toString());
                         // value = data;

                      },
                      hint: const Text("Seleciona uma disciplina",
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      items: List.generate(model.disciplinaList.length, (index) {
                        var e = model.disciplinaList[index];
                        return DropdownMenuItem(
                          value: e.nome.toString(),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: SizedBox(
                                width: MediaQuery.sizeOf(context).width - 50,
                                child: Text(e.nome,
                                    style: const TextStyle(fontSize: 14))),
                          ),
                        );
                      }),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null) {
                          return "Texto invalido";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        alignLabelWithHint: true,
                        contentPadding: const EdgeInsets.only(
                            left: 8, right: 8, top: 12, bottom: 12),
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0x4DFFFFFF)),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        disabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0x4DFFFFFF)),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: (model.values != null || model.values != "") ? Colors.blueAccent:Colors.red),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                      itemCount: model.alunonsList.length,
                      itemBuilder: (context,index)=> ListTile(
                        onTap: (){
                            showDialog(context: context, builder: (context)=> AlertDialog(
                              title: Text("Atribuição de notas",style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: SettingsCki.segoeEui
                              ),),
                              content: Form(
                                key: formKey,
                                child: SizedBox(
                                  height: 270,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.blue[900],
                                            borderRadius:
                                            BorderRadius.circular(kDefaultPadding),
                                          ),
                                          child:  Center(
                                            child: Text(model.values.toString(),
                                              style: const TextStyle(
                                                  color: Colors.white
                                              ),
                                            ),
                                          ),
                                        ),
                                        kHalfSizedBox,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Primeira prova"),
                                            SizedBox(
                                              width: 70,
                                              height: 30,
                                              child: TextFormField(
                                                controller: note1,
                                                minLines: 1,
                                                textInputAction: TextInputAction.next,
                                                keyboardType: TextInputType.number,
                                                textAlign: TextAlign.center,
                                                onChanged: (value){},
                                                decoration: InputDecoration(
                                                  // hintText: "nota",
                                                  label: const Text("nota"),
                                                  enabledBorder: const OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.blue),
                                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                  ),
                                                  disabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey.shade100),
                                                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                                  ),
                                                  focusedBorder: const OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.blue),
                                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                  ),
                                                  errorBorder: const OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.red),
                                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                  ),
                                                  focusedErrorBorder: const OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.red),
                                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                  ),
                                                ),
                                    
                                              ),
                                            )
                                          ],
                                        ),
                                        kHalfSizedBox,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Segunda Prova"),
                                            SizedBox(
                                              width: 70,
                                              height: 30,
                                              child: TextFormField(
                                                controller: note2,
                                                minLines: 1,
                                                textInputAction: TextInputAction.next,
                                                keyboardType: TextInputType.number,
                                                textAlign: TextAlign.center,
                                                onChanged: (value){},
                                                decoration: InputDecoration(
                                                  // hintText: "nota",
                                                  label: const Text("nota"),
                                                  enabledBorder: const OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.blue),
                                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                  ),
                                                  disabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey.shade100),
                                                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                                  ),
                                                  focusedBorder: const OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.blue),
                                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                  ),
                                                  errorBorder: const OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.red),
                                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                  ),
                                                  focusedErrorBorder: const OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.red),
                                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                  ),
                                                ),
                                    
                                              ),
                                            )
                                          ],
                                        ),
                                        kHalfSizedBox,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Terceira Prova"),
                                            SizedBox(
                                              width: 70,
                                              height: 30,
                                              child: TextFormField(
                                                controller: note3,
                                                minLines: 1,
                                                textInputAction: TextInputAction.next,
                                                keyboardType: TextInputType.number,
                                                textAlign: TextAlign.center,
                                                onChanged: (value){},
                                                decoration: InputDecoration(
                                                  // hintText: "nota",
                                                  label: const Text("nota"),
                                                  enabledBorder: const OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.blue),
                                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                  ),
                                                  disabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey.shade100),
                                                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                                  ),
                                                  focusedBorder: const OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.blue),
                                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                  ),
                                                  errorBorder: const OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.red),
                                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                  ),
                                                  focusedErrorBorder: const OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.red),
                                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                  ),
                                                ),
                                    
                                              ),
                                            )
                                          ],
                                        ),
                                        kHalfSizedBox,
                                        const Divider(),
                                        const Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Média",style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16
                                            ),),
                                            Text("14,5",style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: Colors.green
                                            ))
                                          ],
                                        ),
                                    
                                      ],
                                    
                                      ),
                                  ),
                                ),

                              ),
                              actions: [
                                if ("Pending" == 'Pending')
                                //then show button
                                  AssignmentButton(
                                    onPress: () {
                                     Navigator.pop(context);
                                    },
                                    title: 'Anexar nota',
                                  ),
                              ],

                            ));

                        },
                        leading: CircleAvatar(
                          // backgroundColor: Colors.transparent,
                          child: Image.asset("assets/images/image.png"),
                        ),
                        title: Text(model.alunonsList[index].nome),
                        trailing: const Icon(Icons.edit,color: Colors.blue,),
                      )),
                ),


              ],
            ),


          );
        });
  }
}
