import 'package:flutter/material.dart';

import '../../../core/configuration/configuration.dart';
import '../alunos_matriculados/alunos_matriculados.dart';

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
        title: Text("Area Administrativa"),
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

          Padding(
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

          Padding(
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

          Padding(
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

          Padding(
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

          Padding(
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

          Padding(
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

          Padding(
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

          Padding(
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

        ],
      ),
    );
  }
}
