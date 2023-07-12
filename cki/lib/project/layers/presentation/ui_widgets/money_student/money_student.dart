


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/configuration/configuration.dart';

class MoneyStudent extends StatefulWidget {
  const MoneyStudent({Key? key}) : super(key: key);

  @override
  State<MoneyStudent> createState() => _MoneyStudentState();
}

class _MoneyStudentState extends State<MoneyStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Área financeira",style: TextStyle(
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
        actions: [
         /* Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(FontAwesomeIcons.moneyBillAlt,color: Colors.green,size: 30,),
          ),*/
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
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),

                  ),
                  child: Center(
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/images/close-circle.png", width: 30,height: 30,color: Colors.red,),
                              const SizedBox(width: 18,),
                              Text("FT FT001/1",style: TextStyle(
                                  fontFamily: SettingsCki.segoeEui,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16
                              ),),
                              const SizedBox(width: 10,),
                              Text("30.000,00 AOA",style: TextStyle(
                                  fontFamily: SettingsCki.segoeEui,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16
                              ),),
                              const SizedBox(width: 30,),

                              const Icon(FontAwesomeIcons.download,color: Colors.white,)
                            ],
                          ),

                          Text("Data de emissão: 2023-09-12",style: TextStyle(
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
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8,left: 20,right: 20,bottom: 5),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),

                  ),
                  child: Center(
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(FontAwesomeIcons.checkCircle,color: Colors.white,size: 30,),
                             // Image.asset("assets/images/close-circle.png", width: 30,height: 30,color: Colors.red,),
                              const SizedBox(width: 18,),
                              Text("FT FT001/1",style: TextStyle(
                                  fontFamily: SettingsCki.segoeEui,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16
                              ),),
                              const SizedBox(width: 10,),
                              Text("30.000,00 AOA",style: TextStyle(
                                  fontFamily: SettingsCki.segoeEui,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16
                              ),),
                              const SizedBox(width: 30,),

                              const Icon(FontAwesomeIcons.download,color: Colors.white,)
                            ],
                          ),

                          Text("Data de emissão: 2023-09-12",style: TextStyle(
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
