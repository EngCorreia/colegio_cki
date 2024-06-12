import 'package:cki/views/teachers/atribuicao_notas/teacher_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import '../../../project/layers/presentation/ui_widgets/calendary_screen/widgets/assignment_widgets.dart';
import '../../../project/layers/presentation/ui_widgets/datesheet_screen/data/constList.dart';


class TeacherView extends HookWidget{

  const TeacherView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final note1 = useTextEditingController();
    final note2 = useTextEditingController();
    final note3 = useTextEditingController();
    return ViewModelBuilder<TeacherViewModel>.reactive(
        viewModelBuilder: ()=> TeacherViewModel(),
        builder: (context,model,child){
          return Scaffold(
            appBar: AppBar(
              title: const Text("Correia Chumbo"),
              elevation: 0,
            ),
            body: Form(
              key: formKey,
              child: Container(
                        decoration: BoxDecoration(
                          color: kOtherColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.all(kDefaultPadding),
                            itemCount: 4,
                            itemBuilder: (context, int index) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: kDefaultPadding),
                                child:
                                    Container(
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
                                            Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: Colors.blue[900],
                                                borderRadius:
                                                BorderRadius.circular(kDefaultPadding),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  "Lingua Portuguesa",
                                                  style: TextStyle(
                                                    color: Colors.white
                                                  ),
                                                ),
                                              ),
                                            ),
                                            kHalfSizedBox,
                                            Text(
                                              "Inserção de notas",
                                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                                color: kTextBlackColor,
                                                fontWeight: FontWeight.w900,
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
                                                    textAlign: TextAlign.right,
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
                                                    textAlign: TextAlign.right,
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
                                                   textAlign: TextAlign.right,
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

                                            kHalfSizedBox,
                                            //use condition here to display button
                                            if ("Pending" == 'Pending')
                                            //then show button
                                              AssignmentButton(
                                                onPress: () {
                                                  //submit here
                                                },
                                                title: 'Anexar nota',
                                              ),
                                          ],
                                        ),

                                    ),

                              );
                            }),
                      ),
            ),



          );
        });
  }


}
