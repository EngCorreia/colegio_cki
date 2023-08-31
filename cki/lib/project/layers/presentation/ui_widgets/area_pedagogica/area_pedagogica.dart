import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/configuration/configuration.dart';
import '../alunos_matriculados/alunos_matriculados.dart';
import '../cadastrar_turma/cadatrar_turma_ui.dart';

class AreaPedagogica extends StatefulWidget {
  const AreaPedagogica({Key? key}) : super(key: key);

  @override
  State<AreaPedagogica> createState() => _AreaPedagogicaState();
}

class _AreaPedagogicaState extends State<AreaPedagogica> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Área Administrativa ",style: TextStyle(
          fontFamily: SettingsCki.segoeEui,
          color: Colors.white,
          fontSize: 18
        ),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              // backgroundColor: Colors.transparent,
              child: Image.asset("assets/images/image.png"),
            ),
          )
        ],
      ),

      floatingActionButton: SpeedDial(
        onOpen: () {

        },
        backgroundColor: Colors.white,
        animatedIcon: AnimatedIcons.menu_close,
        overlayOpacity: 0.7,
        animatedIconTheme: const IconThemeData(
          size: 30.0,
          color: Colors.orange,
        ),
        children: [
          SpeedDialChild(
            labelWidget: Padding(
              padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
              child: Container(
                height: 45,
                width: 150,
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 1,
                    )
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [Colors.white, Colors.white],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                          width: 140,
                          child: Text("Área Pedagógica",
                            style: TextStyle(
                                fontFamily: SettingsCki.segoeEui,
                                color: Colors.blue),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                          width: 140,
                          child: Text("Saiba mais",
                            style: TextStyle(
                                fontFamily: SettingsCki.segoeEui,
                                color: Colors.black,
                                fontSize: 10),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            child: const Icon(FontAwesomeIcons.graduationCap, color: Colors.blue, size: 20,),
            labelStyle: TextStyle(fontFamily: SettingsCki.segoeEui, color: Colors.blue),
            onTap: (){
            //  Navigator.push(context, MaterialPageRoute(builder: (context)=> const AreaPedagogica()));
            },
          ),


          SpeedDialChild(
            labelWidget: Padding(
              padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
              child: Container(
                height: 45,
                width: 150,
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 1,
                    )
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [Colors.white, Colors.white],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                          width: 140,
                          child: Text("Editar alunos",
                            style: TextStyle(
                                fontFamily: SettingsCki.segoeEui,
                                color: Colors.blue),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                          width: 140,
                          child: Text("Editar alunos matriculados",
                            style: TextStyle(
                                fontFamily: SettingsCki.segoeEui,
                                color: Colors.black,
                                fontSize: 10),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            child: const Icon(FontAwesomeIcons.facebookMessenger, color: Colors.blue, size: 20,),
            labelStyle: TextStyle(fontFamily: SettingsCki.segoeEui, color: Colors.blue),
            onTap: (){
            },
          ),


          SpeedDialChild(
            labelWidget: Padding(
              padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
              child: Container(
                height: 45,
                width: 150,
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 1,
                    )
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [Colors.white, Colors.white],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                          width: 140,
                          child: Text("Editar turmas",
                            style: TextStyle(
                                fontFamily: SettingsCki.segoeEui,
                                color: Colors.blue),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                          width: 140,
                          child: Text("Cadastro de turmas",
                            style: TextStyle(
                                fontFamily: SettingsCki.segoeEui,
                                color: Colors.black,
                                fontSize: 10),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            child: const Icon(FontAwesomeIcons.facebookMessenger, color: Colors.blue, size: 20,),
            labelStyle: TextStyle(fontFamily: SettingsCki.segoeEui, color: Colors.blue),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const CadastrarTurmas()));

            },
          ),

        ],
      ),

      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const AlunosMatriculados(
              classeName: "1º_classe",
            ))),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 1,
                    )
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [Colors.white, Colors.white],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    // backgroundColor: Colors.transparent,
                    child: Image.asset("assets/course/course4.png"),
                  ),
                  title: Text("Alunos matriculados 1º classe",
                    style: TextStyle(
                        fontFamily: SettingsCki.segoeEui,
                        color: Colors.blue),
                  ),
                  subtitle: Text("Todos alunos matriculado",
                    style: TextStyle(
                        fontFamily: SettingsCki.segoeEui,
                        color: Colors.black,
                        fontSize: 10),
                  ),
                )

              ),
            ),
          ),

          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const AlunosMatriculados(
              classeName: "2º_classe",
            ))),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 1,
                      )
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.3, 1],
                      colors: [Colors.white, Colors.white],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Image.asset("assets/course/course2.png"),
                    ),
                    title: Text("Alunos matriculados 2º classe",
                      style: TextStyle(
                          fontFamily: SettingsCki.segoeEui,
                          color: Colors.blue),
                    ),
                    subtitle: Text("Todos alunos matriculado",
                      style: TextStyle(
                          fontFamily: SettingsCki.segoeEui,
                          color: Colors.black,
                          fontSize: 10),
                    ),
                  )

              ),
            ),
          ),

          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const AlunosMatriculados(
              classeName: "3º_classe",
            ))),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 1,
                      )
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.3, 1],
                      colors: [Colors.white, Colors.white],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Image.asset("assets/course/course3.png"),
                    ),
                    title: Text("Alunos matriculados 3º classe",
                      style: TextStyle(
                          fontFamily: SettingsCki.segoeEui,
                          color: Colors.blue),
                    ),
                    subtitle: Text("Todos alunos matriculado",
                      style: TextStyle(
                          fontFamily: SettingsCki.segoeEui,
                          color: Colors.black,
                          fontSize: 10),
                    ),
                  )

              ),
            ),
          ),

          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const AlunosMatriculados(
              classeName: "4º_classe",
            ))),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 1,
                      )
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.3, 1],
                      colors: [Colors.white, Colors.white],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Image.asset("assets/course/course8.png"),
                    ),
                    title: Text("Alunos matriculados 4º classe",
                      style: TextStyle(
                          fontFamily: SettingsCki.segoeEui,
                          color: Colors.blue),
                    ),
                    subtitle: Text("Todos alunos matriculado",
                      style: TextStyle(
                          fontFamily: SettingsCki.segoeEui,
                          color: Colors.black,
                          fontSize: 10),
                    ),
                  )

              ),
            ),
          ),

          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const AlunosMatriculados(
              classeName: "5º_classe",
            ))),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 1,
                      )
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.3, 1],
                      colors: [Colors.white, Colors.white],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Image.asset("assets/course/course6.png"),
                    ),
                    title: Text("Alunos matriculados 5º classe",
                      style: TextStyle(
                          fontFamily: SettingsCki.segoeEui,
                          color: Colors.blue),
                    ),
                    subtitle: Text("Todos alunos matriculado",
                      style: TextStyle(
                          fontFamily: SettingsCki.segoeEui,
                          color: Colors.black,
                          fontSize: 10),
                    ),
                  )

              ),
            ),
          ),

          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const AlunosMatriculados(
              classeName: "6º_classe",
            ))),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 1,
                      )
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.3, 1],
                      colors: [Colors.white, Colors.white],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Image.asset("assets/course/course5.png"),
                    ),
                    title: Text("Alunos matriculados 6º classe",
                      style: TextStyle(
                          fontFamily: SettingsCki.segoeEui,
                          color: Colors.blue),
                    ),
                    subtitle: Text("Todos alunos matriculado",
                      style: TextStyle(
                          fontFamily: SettingsCki.segoeEui,
                          color: Colors.black,
                          fontSize: 10),
                    ),
                  )

              ),
            ),
          ),

          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const AlunosMatriculados(
              classeName: "7º_classe",
            ))),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 1,
                      )
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.3, 1],
                      colors: [Colors.white, Colors.white],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Image.asset("assets/course/course2.png"),
                    ),
                    title: Text("Alunos matriculados 7º classe",
                      style: TextStyle(
                          fontFamily: SettingsCki.segoeEui,
                          color: Colors.blue),
                    ),
                    subtitle: Text("Todos alunos matriculado",
                      style: TextStyle(
                          fontFamily: SettingsCki.segoeEui,
                          color: Colors.black,
                          fontSize: 10),
                    ),
                  )

              ),
            ),
          ),

          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const AlunosMatriculados(
              classeName: "8º_classe",
            ))),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 1,
                      )
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.3, 1],
                      colors: [Colors.white, Colors.white],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Image.asset("assets/course/course6.png"),
                    ),
                    title: Text("Alunos matriculados 8º classe",
                      style: TextStyle(
                          fontFamily: SettingsCki.segoeEui,
                          color: Colors.blue),
                    ),
                    subtitle: Text("Todos alunos matriculado",
                      style: TextStyle(
                          fontFamily: SettingsCki.segoeEui,
                          color: Colors.black,
                          fontSize: 10),
                    ),
                  )

              ),
            ),
          ),

          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const AlunosMatriculados(
              classeName: "9º_classe",
            ))),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 1,
                      )
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.3, 1],
                      colors: [Colors.white, Colors.white],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Image.asset("assets/course/course5.png"),
                    ),
                    title: Text("Alunos matriculados 9º classe",
                      style: TextStyle(
                          fontFamily: SettingsCki.segoeEui,
                          color: Colors.blue),
                    ),
                    subtitle: Text("Todos alunos matriculado",
                      style: TextStyle(
                          fontFamily: SettingsCki.segoeEui,
                          color: Colors.black,
                          fontSize: 10),
                    ),
                  )

              ),
            ),
          ),

        ],
      ),
    );
  }
}
