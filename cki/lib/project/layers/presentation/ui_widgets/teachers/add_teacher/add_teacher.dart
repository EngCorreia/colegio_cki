import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/configuration/configuration.dart';
import '../../../../domain/entities/teachers_entity/teachers_entity.dart';
import '../../../controllers/save_new_teacher_controller/save_new_teacher_controller.dart';


class AddTeacher extends StatefulWidget {
  const AddTeacher({Key? key}) : super(key: key);

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
                  // controller: _textEditingController,
                  decoration: const InputDecoration(
                    //icon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    //prefixIcon: const Icon(Icons.person), // Add prefix icon
                    hintText: "Número de telefone",
                    labelText: "Número de telefone",
                    // errorText: createContactUser.validateName,
                  ),

                  onChanged: (value) {

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
                  // controller: _textEditingController,
                  decoration: const InputDecoration(
                    //icon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    //prefixIcon: const Icon(Icons.person), // Add prefix icon
                    hintText: "Número de telefone",
                    labelText: "Número de telefone",
                    // errorText: createContactUser.validateName,
                  ),

                  onChanged: (value) {

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
                  // controller: _textEditingController,
                  decoration: const InputDecoration(
                    //icon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    //prefixIcon: const Icon(Icons.person), // Add prefix icon
                    hintText: "Número de telefone",
                    labelText: "Número de telefone",
                    // errorText: createContactUser.validateName,
                  ),

                  onChanged: (value) {

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
                  // controller: _textEditingController,
                  decoration: const InputDecoration(
                    //icon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    //prefixIcon: const Icon(Icons.person), // Add prefix icon
                    hintText: "Número de telefone",
                    labelText: "Número de telefone",
                    // errorText: createContactUser.validateName,
                  ),

                  onChanged: (value) {

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
                  // controller: _textEditingController,
                  decoration: const InputDecoration(
                    //icon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    //prefixIcon: const Icon(Icons.person), // Add prefix icon
                    hintText: "Número de telefone",
                    labelText: "Número de telefone",
                    // errorText: createContactUser.validateName,
                  ),

                  onChanged: (value) {

                  },
                  cursorColor: Colors.indigo,
                  // validator: createContactUser.validateSalutation,
                ),
              ),
            ),
          ),


          GestureDetector(
            onTap: () async {
              _controllerSaveNewTeacher.saveTeacher(teachersEntity: TeachersEntity(
                name: "Gabriel Chumbo",
                level: "Licenciado em Direito",
                classTeacher: "1º classe, 2º classe"
              ));
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
}
