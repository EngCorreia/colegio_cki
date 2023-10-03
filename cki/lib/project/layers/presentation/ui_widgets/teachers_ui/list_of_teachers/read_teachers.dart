import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/configuration/configuration.dart';
import '../../../../domain/entities/teachers_entity/teachers_entity.dart';
import '../../../controllers/login_controller/controller_login.dart';
import '../../../controllers/read_teachers_controller/read_teachers_controller.dart';
import '../add_teacher/add_teacher.dart';

class Teachers extends StatefulWidget {
  const Teachers({Key? key}) : super(key: key);

  @override
  State<Teachers> createState() => _TeachersState();
}

class _TeachersState extends State<Teachers> {

  final _teacherListController = GetIt.I.get<ReadTeachersController>();
  final loginController = LoginControl();

  @override
  void initState(){
    super.initState();
    _teacherListController.readAllTeachers();
    loginController.loginUserStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title:  Container(
          height: 35,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 1,

              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 3,right: 8,top: 5,bottom: 5),
            child: TextFormField(
              decoration: const InputDecoration(
                //icon: Icon(Icons.person),
                border: InputBorder.none,
                //hintText: 'Pesquisar',
                labelText: 'Pesquisar professor',
                prefixIcon: Icon(Icons.search_rounded),
                // errorText: createContactUser.validateName,
              ),

              onChanged: (value) {

              },
              cursorColor: Colors.indigo,
              // validator: createContactUser.validateSalutation,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Image.asset("assets/images/graduate.png"),
            ),
          )
        ],
      ),

      floatingActionButton: Observer(
        builder: (_)=> loginController.newStatusUser == 1 ? FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> AddTeacher(teachersEntity: TeachersEntity(),)));
          },
          child: const Icon(Icons.add,color: Colors.white,size: 30,),
        ):Container(),
      ),


      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),

          Observer(builder: (_)=>  GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
                mainAxisExtent: 150),
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 50,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 1,
                        )
                      ]),
                  child: Column(
                    children: [
                      // grid_images(index),
                      SizedBox(
                          child: Padding(
                            padding:
                            const EdgeInsets.all(0.0),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    // width: MediaQuery.of(context).size.width,
                                    child: CircleAvatar(
                                      radius: 35,
                                      child: Image.asset("assets/images/graduate.png"),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text("${_teacherListController.teacherList[index].name}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: SettingsCki.segoeEui,
                                            fontSize: 12)),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text("${_teacherListController.teacherList[index].level}",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontFamily: SettingsCki.segoeEui,
                                        fontSize: 12),
                                  ),

                                  Text("${_teacherListController.teacherList[index].classTeacher}",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontFamily: SettingsCki.segoeEui,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              );
            },
            itemCount: _teacherListController.teacherList.length,
          ),
          ),
          ],
        ),
      ),
    );
  }
}
