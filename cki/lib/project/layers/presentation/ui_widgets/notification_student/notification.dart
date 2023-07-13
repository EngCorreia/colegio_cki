
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/configuration/configuration.dart';

class NotificationUi extends StatefulWidget {
  const NotificationUi({Key? key}) : super(key: key);

  @override
  State<NotificationUi> createState() => _NotificationUiState();
}

class _NotificationUiState extends State<NotificationUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        elevation: 0,
        title: Text("Notificações",style: TextStyle(
            color: Colors.white,
            fontFamily: SettingsCki.segoeEui,
            fontSize: 18
        )),
          leading:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: const Icon(FontAwesomeIcons.graduationCap,color: Colors.black),
            ),
          ),
          actions:  [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                 backgroundColor: Colors.grey[300],
                child: Icon(FontAwesomeIcons.bell,color: Colors.orange[900]),
              ),
            )
          ],

      ),


      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),

            GestureDetector(
              onTap: () async {
                //Navigator.push(context, MaterialPageRoute(builder: (context)=> const NovaMatricula()));
                showDialog(context: context, builder: (context)=> AlertDialog(
                  title: Text("INÍCIO DO ANO LECTIVO 2023",style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: SettingsCki.segoeEui
                  ),),
                  content: Container(
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Caros encarregados, vimos por esta informar que as aulas para o ano lectivo 2023 começam aos 03/09/2023",style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontFamily: SettingsCki.segoeEui
                        )),
                        const SizedBox(
                          height: 10,
                        ),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Data 12/07/2023   Hora: 15h34",style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              fontFamily: SettingsCki.segoeEui
                          )),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.pop(context);

                    }, child: Text("FECHAR")),
                  ],

                ));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8,left: 20,right: 20,bottom: 5),
                child: Container(
                  height: 110,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.orange,
                          blurRadius: 1,
                          spreadRadius: 1,
                          //offset: const Offset(2, 2),
                        ),
                      ],
                  ),
                  child: Center(
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("CALENDARIO ESCOLAR 2023",style: TextStyle(
                              fontFamily: SettingsCki.segoeEui,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16
                          ),),

                          Text("Caros encarregados, temos o prazer de informar sobre o calendario do corrente ano",style: TextStyle(
                              fontFamily: SettingsCki.segoeEui,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontSize: 14
                          ),),

                          Text("12-08-2023",style: TextStyle(
                              fontFamily: SettingsCki.segoeEui,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontSize: 16
                          ),),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),


            GestureDetector(
              onTap: () async {
                //Navigator.push(context, MaterialPageRoute(builder: (context)=> const NovaMatricula()));
                showDialog(context: context, builder: (context)=> AlertDialog(
                  title: Text("INÍCIO DO ANO LECTIVO 2023",style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: SettingsCki.segoeEui
                  ),),
                  content: Container(
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Caros encarregados, vimos por esta informar que as aulas para o ano lectivo 2023 começam aos 03/09/2023",style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontFamily: SettingsCki.segoeEui
                        )),
                        const SizedBox(
                          height: 10,
                        ),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Data 12/07/2023   Hora: 15h34",style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              fontFamily: SettingsCki.segoeEui
                          )),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.pop(context);

                    }, child: Text("FECHAR")),
                  ],

                ));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8,left: 20,right: 20,bottom: 5),
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.orange,
                        blurRadius: 1,
                        spreadRadius: 1,
                        //offset: const Offset(2, 2),
                      ),
                    ],

                  ),
                  child: Center(
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("INÍCIO DO ANO LECTIVO 2023",style: TextStyle(
                              fontFamily: SettingsCki.segoeEui,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16
                          ),),

                          Text("Caros encarregados, vimos por esta informar que o ano lectivo de 2023 ...",style: TextStyle(
                              fontFamily: SettingsCki.segoeEui,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontSize: 14
                          ),),

                          Text("12-08-2023",style: TextStyle(
                              fontFamily: SettingsCki.segoeEui,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontSize: 16
                          ),),
                        ],
                      ),
                    ),
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
