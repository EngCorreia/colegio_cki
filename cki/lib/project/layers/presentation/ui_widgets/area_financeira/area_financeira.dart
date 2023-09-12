import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/configuration/configuration.dart';
import '../alunos_matriculados/alunos_matriculados.dart';
import '../area_pedagogica/dividas_mensal.dart';
import '../cadastrar_turma/cadatrar_turma_ui.dart';
import '../listar_turmas/listagem_de_turmas.dart';

class AreaFinanceira extends StatefulWidget {
  const AreaFinanceira({Key? key}) : super(key: key);

  @override
  State<AreaFinanceira> createState() => _AreaFinanceiraState();
}

class _AreaFinanceiraState extends State<AreaFinanceira> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        title: Text("Área Financeira",style: TextStyle(
            fontFamily: SettingsCki.segoeEui,
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold
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

      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const DividasMensal(
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
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const DividasMensal(
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
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const DividasMensal(
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
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const DividasMensal(
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
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const DividasMensal(
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
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const DividasMensal(
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
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const DividasMensal(
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
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const DividasMensal(
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
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const DividasMensal(
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
