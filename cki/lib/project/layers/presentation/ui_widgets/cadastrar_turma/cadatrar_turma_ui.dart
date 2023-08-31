
import 'package:flutter/material.dart';

import '../../../core/configuration/configuration.dart';

class CadastrarTurmas extends StatefulWidget {
  const CadastrarTurmas({Key? key}) : super(key: key);

  @override
  State<CadastrarTurmas> createState() => _CadastrarTurmasState();
}

class _CadastrarTurmasState extends State<CadastrarTurmas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Editar turma",style: TextStyle(
        fontFamily: SettingsCki.segoeEui,
      ),),),
      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(
              height: 20,
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
                      hintText: "Introduzir unmero da sala",
                      labelText: "Introduzir unmero da sala",
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
                    keyboardType: TextInputType.text,
                    // controller: _textEditingController,
                    decoration: const InputDecoration(
                      //icon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      //prefixIcon: const Icon(Icons.person), // Add prefix icon
                      hintText: "Introduzir nome da sala",
                      labelText: "Introduzir  nome sala",
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
          ],
        ),
      ),
    );
  }
}
