import 'package:flutter/material.dart';

import '../../../core/configuration/configuration.dart';


class NovaMatricula extends StatefulWidget {
  const NovaMatricula({Key? key}) : super(key: key);

  @override
  State<NovaMatricula> createState() => _NovaMatriculaState();
}

class _NovaMatriculaState extends State<NovaMatricula> {

  DateTime dateTime = DateTime.now();
  final _textEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Colégio Kalabo Internacional",style: TextStyle(
            color: Colors.black,
            fontFamily: SettingsCki.segoeEui,
            fontWeight: FontWeight.bold,
            fontSize: 16
        ),),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 20,top: 4,),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Formulário de Admissão",style: TextStyle(
                    color: Colors.orange,
                    fontFamily: SettingsCki.segoeEui,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
              child: TextFormField(
                decoration: const InputDecoration(
                  //icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  hintText: 'Nome do Aluno',
                  labelText: 'Nome do Aluno',
                  prefixIcon: Icon(Icons.person),
                  // errorText: createContactUser.validateName,
                ),

                onChanged: (value) {

                },
                cursorColor: Colors.indigo,
                // validator: createContactUser.validateSalutation,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
              child: TextFormField(
                decoration: const InputDecoration(
                  //icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  hintText: 'Telefone',
                  labelText: 'Telefone',
                  prefixIcon: Icon(Icons.call),

                  // errorText: createContactUser.validateName,
                ),

                onChanged: (value) {

                },
                cursorColor: Colors.indigo,
                // validator: createContactUser.validateSalutation,
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
              child: TextFormField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  //icon: Icon(Icons.person),
                  border: const OutlineInputBorder(),
                  //prefixIcon: const Icon(Icons.person), // Add prefix icon
                  suffixIcon: IconButton(onPressed: (){
                    _showDate();
                  },
                  icon: const Icon(Icons.calendar_month),),
                  hintText: dateTime.toString(),
                  labelText: "Data de nascimento",
                  // errorText: createContactUser.validateName,
                ),

                onChanged: (value) {

                },
                cursorColor: Colors.indigo,
                // validator: createContactUser.validateSalutation,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
              child: TextFormField(
                decoration: const InputDecoration(
                  //icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  hintText: 'Endereço',
                  labelText: 'Endereço',
                    prefixIcon: Icon(Icons.add_home_work_outlined)
                  // errorText: createContactUser.validateName,
                ),

                onChanged: (value) {

                },
                cursorColor: Colors.indigo,
                // validator: createContactUser.validateSalutation,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
              child: TextFormField(
                decoration: const InputDecoration(
                  //icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  hintText: 'Nome do Pai',
                  labelText: 'Nome do Pai',
                  //prefixIcon: const Icon(Icons.person),
                  // errorText: createContactUser.validateName,
                ),

                onChanged: (value) {

                },
                cursorColor: Colors.indigo,
                // validator: createContactUser.validateSalutation,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
              child: TextFormField(
                decoration: const InputDecoration(
                  //icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  hintText: 'Nome da mãe',
                  labelText: 'Nome da mãe',
                  // errorText: createContactUser.validateName,
                ),

                onChanged: (value) {

                },
                cursorColor: Colors.indigo,
                // validator: createContactUser.validateSalutation,
              ),
            ),


            const SizedBox(
              height: 20,
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8,left: 8,right: 8,bottom: 8),
                    child: Container(
                      height: 45,
                      width: 150,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.black45, blurRadius: 1,)
                        ],
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.3, 1],
                          colors: [
                            Colors.red,
                            Colors.red,
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Center(child: Text("Cancelar",style: TextStyle(
                          color: Colors.white,
                          fontFamily: SettingsCki.segoeEui,
                          fontWeight: FontWeight.bold
                      ),)),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () async {
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8,left: 8,right: 8,bottom: 8),
                    child: Container(
                      height: 45,
                      width: 150,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.black45, blurRadius: 1,)
                        ],
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.3, 1],
                          colors: [
                            Colors.blue,
                            Colors.blue,
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Center(child: Text("Gravar",style: TextStyle(
                          color: Colors.white,
                          fontFamily: SettingsCki.segoeEui,
                          fontWeight: FontWeight.bold
                      ),)),
                    ),
                  ),
                )

              ],
            )

          ],
        ),
      ),
    );
  }

  _showDate(){
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    ).then((value){
      setState(() {
        dateTime = value!;
        _textEditingController.text = value.toString();
      });
    });
  }
}
