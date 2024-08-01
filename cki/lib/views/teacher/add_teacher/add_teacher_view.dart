import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../project/layers/core/configuration/configuration.dart';
import '../../../project/layers/domain/entities/teachers_entity/teachers_entity.dart';
import 'add_teacher_view_model.dart';


class AddTeacherView extends StatefulWidget {
  final TeachersEntity teachersEntity;
  const AddTeacherView({Key? key, required this.teachersEntity}) : super(key: key);

  @override
  State<AddTeacherView> createState() => _AddTeacherState();
}

class _AddTeacherState extends State<AddTeacherView> {

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    var value;
    buildSheet(AddTeacherViewModel model) {
      return Column(
        mainAxisSize: MainAxisSize.min,
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
                value: value,
                borderRadius: BorderRadius.circular(15),
                onChanged: (data) {
                  setState(() {
                    value = data;
                  });
                },
                hint: const Text("Adicionar turmas/classe",
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                items: List.generate(model.classes.length, (index) {
                  var e = model.classes[index];
                  return DropdownMenuItem(
                    value: e,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                          width: MediaQuery.sizeOf(context).width - 50,
                          child: Text(e.toString(),
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
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.only(
                      left: 8, right: 8, top: 12, bottom: 12),
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0x4DFFFFFF)),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0x4DFFFFFF)),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                    borderRadius:
                    BorderRadius.all(Radius.circular(10.0)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 40,
          ),

          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () async {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.red,
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
                        " Cancelar ",
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
              GestureDetector(
                onTap: () async {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40,
                  width: 150,
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
            ],
          ),
          const SizedBox(height: 30,)
        ],
      );
    }
    return ViewModelBuilder<AddTeacherViewModel>.reactive(
        viewModelBuilder: ()=> AddTeacherViewModel(),
        builder: (context,model,child){
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text("Colegio Kalabo Internacional",style: TextStyle(
                  fontFamily: SettingsCki.segoeEui,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Colors.blue),),
            ),
            body: Form(
              key: formKey,
              child: ListView(
                children: [

                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: SizedBox(
                      //width: 200,
                      height: 50,
                      child: TextFormField(
                        //controller: note1,
                        minLines: 1,
                        onChanged: (value) {
                          widget.teachersEntity.name = value;
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                           hintText: "Nome completo",
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

                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 15),
                    child: SizedBox(
                      //width: 200,
                      height: 50,
                      child: TextFormField(
                        //controller: note1,
                        minLines: 1,
                        onChanged: (value) {
                          widget.teachersEntity.phone = int.parse(value);
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          hintText: "Telefone",
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

                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 15),
                    child: SizedBox(
                      //width: 200,
                      height: 50,
                      child: TextFormField(
                        //controller: note1,
                        minLines: 1,
                        onChanged: (value) {
                          widget.teachersEntity.email = value;
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          hintText: "Email",
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
                        value: value,
                        borderRadius: BorderRadius.circular(15),
                        onChanged: (data) {
                          setState(() {
                            value = data;
                          });
                        },
                        hint: const Text("Nivel Academico",
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        items: List.generate(model.academic.length, (index) {
                          var e = model.academic[index];
                          return DropdownMenuItem(
                            value: e,
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 20),
                              child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width - 50,
                                  child: Text(e.toString(),
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
                        decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          alignLabelWithHint: true,
                          contentPadding: EdgeInsets.only(
                              left: 8, right: 8, top: 12, bottom: 12),
                          isDense: true,
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0x4DFFFFFF)),
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0x4DFFFFFF)),
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0)),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 5,left: 8,right: 8,bottom: 20),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow:  [
                            BoxShadow(
                              color: Colors.black54.withOpacity(0.3),
                              blurRadius: 1,
                              spreadRadius: 1,
                              // offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Classe a lecionar (0)",
                                  style: TextStyle(
                                      fontFamily: SettingsCki.segoeEui,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 16),
                                ),
                              ),

                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 1,
                                color: Colors.grey,
                              ),

                              InkWell(
                                onTap: ()=> showModalBottomSheet(
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20))),
                                    builder: (context) => buildSheet(model)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 15),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.add,color: Colors.blueAccent,),
                                      const SizedBox(width: 10,),
                                      Text("Adicionar mais",style: TextStyle(
                                          fontFamily: SettingsCki.segoeEui,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                          fontSize: 15))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                    ),
                  ),

                  GestureDetector(
                    onTap: () async {
                      model.controllerSaveNewTeacher.saveTeacher(teachersEntity: widget.teachersEntity);
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8,left: 10,right: 10,bottom: 5),
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.blue[900],
                          borderRadius: BorderRadius.circular(5),
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
                          child: Text("GRAVAR",style: TextStyle(
                              fontFamily: SettingsCki.segoeEui,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontSize: 16
                          ),),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        });
  }
}
