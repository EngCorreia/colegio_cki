import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/configuration/configuration.dart';
import '../../../../domain/entities/teachers_entity/teachers_entity.dart';
import '../../../controllers/save_new_teacher_controller/save_new_teacher_controller.dart';


class AddTeacher extends StatefulWidget {
  final TeachersEntity teachersEntity;
  const AddTeacher({Key? key, required this.teachersEntity}) : super(key: key);

  @override
  State<AddTeacher> createState() => _AddTeacherState();
}

class _AddTeacherState extends State<AddTeacher> {
  final _controllerSaveNewTeacher = GetIt.I.get<SaveNewTeacherController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Colegio Kalabo Internacional",style: TextStyle(
            fontFamily: SettingsCki.segoeEui,
            fontWeight: FontWeight.bold,
        color: Colors.white),),
      ),
      body: ListView(
        children: [

          Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
            color: Colors.orange,
            child: Center(child: Text("Cadastro de professor",style: TextStyle(
                fontFamily: SettingsCki.segoeEui,
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold))),
          ),

          const SizedBox(
            height: 30,
          ),


          Padding(
            padding: const EdgeInsets.only(right: 20,left: 20, bottom: 10),
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
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  // controller: _textEditingController,
                  decoration: const InputDecoration(
                    //icon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    //prefixIcon: const Icon(Icons.person), // Add prefix icon
                    hintText: "Introduzir nome",
                    labelText: "Introduzir  nome",
                    // errorText: createContactUser.validateName,
                  ),

                  onChanged: (value) {
                    widget.teachersEntity.name = value;
                  },
                  cursorColor: Colors.indigo,
                  // validator: createContactUser.validateSalutation,
                ),
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(right: 20,left: 20, bottom: 10),
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
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  // controller: _textEditingController,
                  decoration: const InputDecoration(
                    //icon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    //prefixIcon: const Icon(Icons.person), // Add prefix icon
                    hintText: "Introduzir morada",
                    labelText: "Introduzir morada",
                    // errorText: createContactUser.validateName,
                  ),

                  onChanged: (value) {
                    widget.teachersEntity.address = value;
                  },
                  cursorColor: Colors.indigo,
                  // validator: createContactUser.validateSalutation,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 20,left: 20, bottom: 10),
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
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  // controller: _textEditingController,
                  decoration: const InputDecoration(
                    //icon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    //prefixIcon: const Icon(Icons.person), // Add prefix icon
                    hintText: "Introduza número de telefone",
                    labelText: "Introduza número de telefone",
                    // errorText: createContactUser.validateName,
                  ),

                  onChanged: (value) {
                    widget.teachersEntity.phone = int.parse(value);
                  },
                  cursorColor: Colors.indigo,
                  // validator: createContactUser.validateSalutation,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 20,left: 20, bottom: 10),
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
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  // controller: _textEditingController,
                  decoration: const InputDecoration(
                    //icon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    //prefixIcon: const Icon(Icons.person), // Add prefix icon
                    hintText: "Introduzir o email",
                    labelText: "Introduzir o email",
                    // errorText: createContactUser.validateName,
                  ),

                  onChanged: (value) {
                    widget.teachersEntity.email = value;
                  },
                  cursorColor: Colors.indigo,
                  // validator: createContactUser.validateSalutation,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 20,left: 20, bottom: 10),
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
                    widget.teachersEntity.level = nivel;
                  },

                  required: false,
                  hintText: "Nivel academico",
                  items: academic.map((element) => element.toString().replaceAll("()", "")).toList(),
                )
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 20,left: 20, bottom: 10),
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
                    String? classe = value.toString();
                    widget.teachersEntity.classTeacher = classe;
                  },
                  required: false,
                  hintText: "Classe a lecionar ",
                  items: classes.map((element) => element.toString().replaceAll("()", "")).toList(),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 20,left: 20, bottom: 10),
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
                child: TextFormField(
                  // controller: _textEditingController,
                  decoration: const InputDecoration(
                    //icon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    //prefixIcon: const Icon(Icons.person), // Add prefix icon
                    hintText: "Experiençias profissionais",
                    labelText: "Experiençias profissionais",
                    // errorText: createContactUser.validateName,
                  ),

                  onChanged: (value) {
                    widget.teachersEntity.experience = value;
                  },
                  cursorColor: Colors.indigo,
                  // validator: createContactUser.validateSalutation,
                ),
              ),
            ),
          ),


          GestureDetector(
            onTap: () async {
              _controllerSaveNewTeacher.saveTeacher(teachersEntity: widget.teachersEntity);
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 8,left: 20,right: 20,bottom: 5),
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

          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Divider(),
          ),


        ],
      ),
    );
  }


  List<String> academic = [
    "Ensino Médio",
    "Bacharel",
    "Licenciatura",
    "Mestrado",
    "PHD",
    "Mestre",
  ];

  List<String> classes = [
    "1ª Classe",
    "2ª Classe",
    "3ª Classe",
    "4ª Classe",
    "5ª Classe",
    "6ª Classe",
    "7ª Classe",
    "8ª Classe",
    "9ª Classe",
  ];
}
