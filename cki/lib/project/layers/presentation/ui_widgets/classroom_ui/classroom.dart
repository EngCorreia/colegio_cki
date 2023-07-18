



import 'package:carousel_slider/carousel_slider.dart';
import 'package:cki/project/layers/core/configuration/configuration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClassRoom extends StatefulWidget {
  const ClassRoom({Key? key}) : super(key: key);

  @override
  State<ClassRoom> createState() => _ClassRoomState();
}

class _ClassRoomState extends State<ClassRoom> {

  List<String> classRoomList = [
    "assets/classRoom/class_room1.jpeg",
    "assets/classRoom/class_room3.jpeg",
    "assets/classRoom/class_room2.jpeg",

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Livros",style: TextStyle(
            fontFamily: SettingsCki.segoeEui,
            color: Colors.white
        ),),
      ),

      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Salas de aula",style: GoogleFonts.aBeeZee(fontSize: 25,color: Colors.white),),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height-130,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemCount: classRoomList.length,
                  itemBuilder: (context,index)=>
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              height: 200,
                              width: 170,
                              color: Colors.amber,
                              child: Image.asset(classRoomList[index],
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
              ),
            ),


          ],
        ),


    );
  }

  final List<String> imgList = [
    'assets/images/matri.png',
    'assets/images/ckiLogo.png',
    'assets/images/colegio.png',
  ];
}
