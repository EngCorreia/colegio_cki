

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/configuration/configuration.dart';

class StudentInformation extends StatefulWidget {
  const StudentInformation({Key? key}) : super(key: key);

  @override
  State<StudentInformation> createState() => _StudentInformationState();
}

class _StudentInformationState extends State<StudentInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Informação do aluno",style: TextStyle(
            color: Colors.orange[900],
            fontFamily: SettingsCki.segoeEui,
            fontSize: 18
        )),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: const Icon(FontAwesomeIcons.graduationCap,color: Colors.black),
          ),
        ),
        actions:  [
          /*Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: const Icon(FontAwesomeIcons.infoCircle,color: Colors.black),
            ),
          )*/

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              // backgroundColor: Colors.transparent,
              child: Image.asset("assets/images/image.png"),
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
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8,left: 20,right: 20,bottom: 5),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 1,
                        spreadRadius: 1,
                         //offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        const SizedBox(width: 10,),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            //borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 2,
                                spreadRadius: 2,
                                // offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                          child:  const Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(FontAwesomeIcons.calendarAlt,color: Colors.orange,size: 20,),
                          ),
                        ),

                        const SizedBox(width: 20,),

                        Text("Calendario",style: TextStyle(
                            fontFamily: SettingsCki.segoeEui,
                            fontWeight: FontWeight.normal,
                            color: Colors.blue,
                            fontSize: 20
                        ),),
                      ],
                    ),
                  ),
                ),
              ),
            ),


            GestureDetector(
              onTap: () async {
                //Navigator.push(context, MaterialPageRoute(builder: (context)=> const NovaMatricula()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8,left: 20,right: 20,bottom: 5),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 1,
                        spreadRadius: 1,
                        //offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        const SizedBox(width: 10,),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            //borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 2,
                                spreadRadius: 2,
                                // offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                          child:  const Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(FontAwesomeIcons.chalkboardTeacher,color: Colors.orange,size: 20,),
                          ),
                        ),

                        const SizedBox(width: 20,),

                        Text("Professor",style: TextStyle(
                            fontFamily: SettingsCki.segoeEui,
                            fontWeight: FontWeight.normal,
                            color: Colors.blue,
                            fontSize: 20
                        ),),
                      ],
                    ),
                  ),
                ),
              ),
            ),


            GestureDetector(
              onTap: () async {
                //Navigator.push(context, MaterialPageRoute(builder: (context)=> const NovaMatricula()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8,left: 20,right: 20,bottom: 5),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 1,
                        spreadRadius: 1,
                        //offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        const SizedBox(width: 10,),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            //borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 2,
                                spreadRadius: 2,
                                // offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                          child:  const Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(FontAwesomeIcons.solidStickyNote,color: Colors.orange,size: 20,),
                          ),
                        ),

                        const SizedBox(width: 20,),

                        Text("Boletin de nota",style: TextStyle(
                            fontFamily: SettingsCki.segoeEui,
                            fontWeight: FontWeight.normal,
                            color: Colors.blue,
                            fontSize: 20
                        ),),
                      ],
                    ),
                  ),
                ),
              ),
            ),


            GestureDetector(
              onTap: () async {
                //Navigator.push(context, MaterialPageRoute(builder: (context)=> const NovaMatricula()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8,left: 20,right: 20,bottom: 5),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 1,
                        spreadRadius: 1,
                        //offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        const SizedBox(width: 10,),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            //borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 2,
                                spreadRadius: 2,
                                // offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                          child:  const Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(FontAwesomeIcons.calendarAlt,color: Colors.orange,size: 20,),
                          ),
                        ),

                        const SizedBox(width: 20,),

                        Text("Assiduidade",style: TextStyle(
                            fontFamily: SettingsCki.segoeEui,
                            fontWeight: FontWeight.normal,
                            color: Colors.blue,
                            fontSize: 20
                        ),),
                      ],
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
