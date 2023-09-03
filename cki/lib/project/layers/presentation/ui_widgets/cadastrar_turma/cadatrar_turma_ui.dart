
import 'package:dropdownfield2/dropdownfield2.dart';
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
      ),),
      elevation: 0,),
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
                    child: DropDownField(
                      textStyle: TextStyle(color: Colors.black54,fontFamily: SettingsCki.segoeEui,fontSize: 16),
                      labelStyle:  TextStyle(color: Colors.black,fontFamily: SettingsCki.segoeEui,fontSize: 16),
                      onValueChanged: (dynamic value){
                        String? nivel = value.toString();
                        // widget.teachersEntity.level = nivel;
                      },

                      required: false,
                      hintText: "Numero das salas",
                      items: sala.map((element) => element.toString()).toList(),
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
                       // widget.teachersEntity.level = nivel;
                      },

                      required: false,
                      hintText: "Classe",
                      items: classes.map((element) => element.toString()).toList(),
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
                        String? nivel = value.toString();
                        // widget.teachersEntity.level = nivel;
                      },

                      required: false,
                      hintText: "Periodo",
                      items: period.map((element) => element.toString()).toList(),
                    )
                ),
              ),
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8,left: 10,right: 10,bottom: 5),
                    child: Container(
                      width: 150,
                      height: 45,
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
                        child: Text("Cancelar",style: TextStyle(
                            fontFamily: SettingsCki.segoeEui,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            fontSize: 16
                        ),),
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () async {
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8,left: 10,right: 10,bottom: 5),
                    child: Container(
                      width: 150,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.orange,
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
                        child: Text("Gravar",style: TextStyle(
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
            )
          ],
        ),
      ),
    );
  }

  List<String> classes = ["1º_classe","2º_classe","3º_classe","4º_classe",
    "5º_classe","6º_classe","7º_classe","8º_classe","9º_classe"];

  List<String> period = ["Manhã","Tarde"];
  List<String> sala = ["Sala 1","Sala 2","Sala 3","Sala 4","Sala 5","Sala 6",
    "Sala 7","Sala 8","Sala 9","Sala 10","Sala 11","Sala 12","Sala 13","Sala 14","Sala 15"];
}
