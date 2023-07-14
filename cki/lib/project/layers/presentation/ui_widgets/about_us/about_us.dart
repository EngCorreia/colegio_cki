
import 'package:cki/project/layers/core/configuration/configuration.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text("Sobre nós",style: TextStyle(fontFamily: SettingsCki.segoeEui),),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            color: Colors.orange,
            child: Row(
              children: [
                Container(
                   // color: Colors.white,
                   // height: 150,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.orange[900],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: GestureDetector(
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 28,
                                        child: Image.asset("assets/images/image.png"),
                                      ),
                                    ),

                                  ]
                              ),

                            )
                        ),
                      ],
                    )
                ),

                Column(
                  children: [
                    Row(
                      children: [
                        Text("52 Publicações"),
                        Text("479 Seguidores"),
                        Text("A seguir 10"),
                      ],
                    ),
                    Text("Colegio Kalabo Internacional"),

                    Text("Instituição angolana de ensino primário com\nreferência internacional."),
                    Text("Slogan: CKI, Formar com Excelência"),

                    Text("geral.cki@gmail.com"),
                    Text("www.cki.ao"),


                  ],
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                //borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 2,
                    spreadRadius: 2,
                    // offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: ListTile(
                leading: Icon(Icons.call),
                title: Text("Tel: +244 951 652 8575"),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                //borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 2,
                    spreadRadius: 2,
                    // offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: ListTile(
                leading: Icon(Icons.call),
                title: Text("Escola privada"),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                //borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 2,
                    spreadRadius: 2,
                    // offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.call),
                      Text("Tel: +244 951 652 8575"),
                    ],
                  ),

                  Column(
                    children: [
                      Text("Tel: +244 951 652 8575"),
                      Text("Tel: +244 951 652 8575"),
                      Text("Tel: +244 951 652 8575"),
                      Text("Tel: +244 951 652 8575"),
                    ],
                  )
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                //borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 2,
                    spreadRadius: 2,
                    // offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: ListTile(
                leading: Icon(Icons.call),
                title: Text("Tel: +244 951 652 8575"),
              ),
            ),
          ),



        ],
      ),

    );
  }
}
