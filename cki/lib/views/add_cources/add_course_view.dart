
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import '../../../project/layers/core/configuration/configuration.dart';
import '../../../project/layers/presentation/ui_widgets/datesheet_screen/data/constList.dart';
import 'add_course_view_model.dart';


class AddCourseView extends HookWidget {
  const AddCourseView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final id = useTextEditingController();
    final name = useTextEditingController();
    final description = useTextEditingController();
    final prices = useTextEditingController();
    final subTittle = useTextEditingController();

    return ViewModelBuilder<AddCourseViewViewModel>.reactive(
        viewModelBuilder: ()=> AddCourseViewViewModel(),
        onViewModelReady: (model) async {
        },
        builder: (context,model,child){
          return Scaffold(
            appBar: AppBar(
              title: const Text("Adicionar classe"),
            ),
            body: Form(
              key: formKey,
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                              name.text = data.toString();
                            },
                            hint: const Text("Seleciona uma disciplina",
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                            items: List.generate(model.disciplinaList.length, (index) {
                              var e = model.disciplinaList[index];
                              return DropdownMenuItem(
                                value: e,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 20),
                                  child: SizedBox(
                                      width: MediaQuery.sizeOf(context).width - 50,
                                      child: Text(e,
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

                      kHalfSizedBox,
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: id,
                            minLines: 1,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.start,
                            onChanged: (value){},
                            decoration: InputDecoration(
                              hintText: "id",
                              //label: const Text("id"),
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
                        ),
                      ),
                      kHalfSizedBox,
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: description,
                            minLines: 1,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.start,
                            onChanged: (value){},
                            decoration: InputDecoration(
                              hintText: "descrição",
                              //label: const Text("descrição"),
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
                        ),
                      ),
                      kHalfSizedBox,
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: prices,
                            minLines: 1,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.start,
                            onChanged: (value){},
                            decoration: InputDecoration(
                               hintText: "Preço",
                              //label: const Text("nota"),
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
                        ),
                      ),
                      kHalfSizedBox,
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: subTittle,
                            minLines: 1,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.start,
                            onChanged: (value){},
                            decoration: InputDecoration(
                               hintText: "Sub Titulo",
                              //label: const Text("nota"),
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
                        ),
                      ),

                      kHalfSizedBox,
                      kHalfSizedBox,

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () async {
                            model.createCourse(id: int.parse(id.text.toString()),
                                name: name.text,
                                description: description.text,
                                prices: int.parse(prices.text.toString()),
                                subTittle: subTittle.text,
                                urlImage: "assets/course/course2.png");
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                  // offset: const Offset(2, 2),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                child: Text(
                                  " Adicionar ",
                                  style: TextStyle(
                                      fontFamily: SettingsCki.segoeEui,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                          ),

                        ),
                      ),
                    ],

                  ),
                ),
              ),
            ),

          );
        });
  }
}
