

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cki/project/layers/core/configuration/configuration.dart';
import 'package:flutter/material.dart';
import '../index_menu/index_page.dart';
import '../register_student/register_student.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        // This is just a basic example. For real apps, you must show some
        // friendly dialog box before call the request method.
        // This is very important to not harm the user experience
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(child: Image.asset("assets/images/logo.png",width: 180,height: 180,)),

            Text("Colegio kalabo Internacional",style: TextStyle(
              fontFamily: SettingsCki.segoeEui,
              fontSize: 20
            ),),

            const SizedBox(
              height: 30,
            ),

            Padding(
              padding: const EdgeInsets.only(right: 50,left: 50,
              bottom: 10),
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

            Padding(
              padding: const EdgeInsets.only(right: 50,left: 50,bottom: 20),
              child: TextFormField(
                // controller: _textEditingController,
                decoration: const InputDecoration(
                  //icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  //prefixIcon: const Icon(Icons.person), // Add prefix icon
                  hintText: "Senha",
                  labelText: "Senha",
                  // errorText: createContactUser.validateName,
                ),

                onChanged: (value) {

                },
                cursorColor: Colors.indigo,
                // validator: createContactUser.validateSalutation,
              ),
            ),

            
            GestureDetector(
              onTap: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> IndexPage()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8,left: 50,right: 50,bottom: 5),
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
                    child: Text("ENTRAR",style: TextStyle(
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
            
            GestureDetector(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> const Register())),
              child: SizedBox(
                height: 50,
                width: 200,
                child: Center(
                  child: Text("Criar conta",style: TextStyle(
                    fontFamily: SettingsCki.segoeEui,
                    fontSize: 20,
                    fontWeight: FontWeight.w300
                  ),),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
