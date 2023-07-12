

import 'package:cki/project/layers/core/configuration/configuration.dart';
import 'package:flutter/material.dart';

import '../home_page/menu_widgets.dart';
import '../index_menu/index_page.dart';
import '../login_ui/login_ui.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(child: Image.asset("assets/images/image.png",width: 180,height: 180,)),

            Text("Colegio kalabo Internacional",style: TextStyle(
                fontFamily: SettingsCki.segoeEui,
                fontSize: 20
            ),),

            const SizedBox(
              height: 30,
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                // controller: _textEditingController,
                decoration: const InputDecoration(
                  //icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  //prefixIcon: const Icon(Icons.person), // Add prefix icon
                  hintText: "Nome",
                  labelText: "Nome",
                  // errorText: createContactUser.validateName,
                ),

                onChanged: (value) {

                },
                cursorColor: Colors.indigo,
                // validator: createContactUser.validateSalutation,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                // controller: _textEditingController,
                decoration: const InputDecoration(
                  //icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  //prefixIcon: const Icon(Icons.person), // Add prefix icon
                  hintText: "Morada",
                  labelText: "Morada",
                  // errorText: createContactUser.validateName,
                ),

                onChanged: (value) {

                },
                cursorColor: Colors.indigo,
                // validator: createContactUser.validateSalutation,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
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
              padding: const EdgeInsets.all(10.0),
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
                padding: const EdgeInsets.only(top: 8,left: 10,right: 10,bottom: 5),
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.blue,
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
                    child: Text("CRIAR CONTA",style: TextStyle(
                        fontFamily: SettingsCki.segoeEui,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16
                    ),),
                  ),
                ),
              ),
            ),



            GestureDetector(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> const Login())),
              child: Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  height: 50,

                  child: Center(
                    child: Text("Voltar",style: TextStyle(
                        fontFamily: SettingsCki.segoeEui,
                        fontSize: 20,
                        fontWeight: FontWeight.w300
                    ),),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 40,
            )

          ],
        ),
      ),
    );
  }
}
