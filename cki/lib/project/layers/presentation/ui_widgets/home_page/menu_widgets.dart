import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/configuration/configuration.dart';
import '../../../data/datasource/sql_server_conection/sql_server_conection.dart';
import '../../../domain/entities/dashboard_entity/dashboard_entity.dart';
import '../about_us/about_us.dart';
import '../contacts/teachers/teachers.dart';
import '../equipe_list/equipe_list.dart';
import '../gallery/gallery.dart';
import '../nova_matricula/new_matricula.dart';
import '../nova_matricula/new_student.dart';
import '../splash_widgets/splash_widgets.dart';



class MenuWidgets extends StatefulWidget {
  @override
  _MenuWidgetsState createState() => _MenuWidgetsState();
}

class _MenuWidgetsState extends State<MenuWidgets> {
  int _current = 0;
  var conn = Connection();

  @override
  void initState() {
    super.initState();
   // conn.openDatabase();
  }


  @override
  Widget build(context) {
    final List<Widget> imageSliders = imgList.map((item) => Container(
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
        child: Stack(
          children: [
            Image.asset(item,
              fit: BoxFit.cover,
              width: 1000,
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Text(' ${imgList.indexOf(item) +1} Imagem',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    )).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title: Text("Colégio Kalabo Internacional",style: TextStyle(
            color: Colors.white,
            fontFamily: SettingsCki.segoeEui,
            fontSize: 16
        ),),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
             // backgroundColor: Colors.transparent,
              child: Image.asset("assets/images/image.png"),
            ),
          )
        ],
      ),

      drawer: Drawer(
        elevation: 1,
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, int index) {
              return Column(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      child: Image.asset("assets/images/image.png"),
                    ),
                    accountName: Text("Correia António Chumbo",style: TextStyle(fontFamily: SettingsCki.segoeEui,fontWeight: FontWeight.bold)),
                    accountEmail: Text("geral.cki@gmail.com", style: TextStyle(fontFamily: SettingsCki.segoeEui)),
                  ),
                  ListTile(
                    leading: Icon(Icons.home_outlined,color: Colors.orange[900],),
                    title: Text('Sobre nós',
                      style: TextStyle(fontFamily: SettingsCki.segoeEui,
                          color: Colors.black54,fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const AboutUs()));

                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: Icon(Icons.settings,color: Colors.orange[900],),
                    title: Text('Configuração',
                      style: TextStyle(fontFamily: SettingsCki.segoeEui,
                          color: Colors.black54,fontWeight: FontWeight.bold),
                    ),
                    onTap: () {

                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: Icon(Icons.account_balance,color: Colors.orange[900],),
                    title: Text('Equipe',
                      style: TextStyle(fontFamily: SettingsCki.segoeEui,
                          color: Colors.black54,fontWeight: FontWeight.bold),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const Equipe()));

                    },
                    // Users(userId: UserModel.userId)
                  ),
                  const Divider(),
                  ListTile(
                    leading: Icon(Icons.photo,color: Colors.orange[900],),
                    title: Text('Galeria',
                      style: TextStyle(fontFamily: SettingsCki.segoeEui,
                          color: Colors.black54,
                      fontWeight: FontWeight.bold),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const Gallery()));
                    },
                  ),
                  const Divider(),
                  ListTile(
                    onTap: (){

                    },
                    leading: Icon(Icons.call,color: Colors.orange[900],),
                    title: Text('Contactos',
                      style: TextStyle(fontFamily: SettingsCki.segoeEui,
                      color: Colors.black54,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: Text('Sair', style: TextStyle(fontFamily: SettingsCki.segoeEui,
                        color: Colors.red,fontSize: 16,fontWeight: FontWeight.bold),
                    ),
                    onTap: () async {
                      final pref = await SharedPreferences.getInstance();
                      pref.setBool("showHome", false);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SplashWidgets()));
                    },
                  ),

                  const Divider(),

                ],
              );
            }),
      ),
        floatingActionButton: SpeedDial(
          onOpen: () {

          },
          backgroundColor: Colors.white,
          animatedIcon: AnimatedIcons.menu_close,
          overlayOpacity: 0.7,
          animatedIconTheme: const IconThemeData(
            size: 30.0,
            color: Colors.orange,
          ),
          children: [
            SpeedDialChild(
              labelWidget: Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                child: Container(
                  height: 45,
                  width: 150,
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 1,
                      )
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.3, 1],
                      colors: [Colors.white, Colors.white],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                            width: 140,
                            child: Text("Área Pedagógica",
                              style: TextStyle(
                                  fontFamily: SettingsCki.segoeEui,
                                  color: Colors.blue),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                            width: 140,
                            child: Text("Saiba mais",
                              style: TextStyle(
                                  fontFamily: SettingsCki.segoeEui,
                                  color: Colors.black,
                                  fontSize: 10),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              child: const Icon(FontAwesomeIcons.graduationCap, color: Colors.blue, size: 20,),
              labelStyle: TextStyle(fontFamily: SettingsCki.segoeEui, color: Colors.blue),
              onTap: (){

              },
            ),

          ],
        ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CarouselSlider(
              items: imageSliders,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.map((url) {
                int index = imgList.indexOf(url);
                return Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 3,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? const Color.fromRGBO(0, 0, 0, 0.9) : const Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                );
              }).toList(),
            ),
             const SizedBox(
               height: 20,
             ),

             Text("ANO LECTIVO 2023/2024",style: TextStyle(
              color: Colors.blue,
              fontFamily: SettingsCki.segoeEui,
               fontWeight: FontWeight.w500,
               fontSize: 20
            ),),

            const SizedBox(
              height: 20,
            ),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> const Teachers())),
                        child: Container(
                          width: 160,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 1,
                                spreadRadius: 1,
                                // offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 6,
                              ),
                              SizedBox(
                                  height: 70,
                                  child: Lottie.asset("assets/jsons/animation_lk16ijyi.json"),),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Professores",style: TextStyle(
                                  fontFamily: SettingsCki.segoeEui,
                                  fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),),

                              Text("Conheça nossos prof..",style: TextStyle(
                                  fontFamily: SettingsCki.segoeEui,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black
                              ),),
                            ],
                          ),
                        ),
                      ),

                      Container(
                        width: 160,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 1,
                              spreadRadius: 1,
                              // offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 6,
                            ),
                            SizedBox(
                              height: 70,
                              child: Image.asset("assets/images/books.png"),),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("Calendario",style: TextStyle(
                                fontFamily: SettingsCki.segoeEui,
                                fontWeight: FontWeight.bold,
                              color: Colors.black
                            ),),

                            Text("Ver calendario",style: TextStyle(
                                fontFamily: SettingsCki.segoeEui,
                                fontWeight: FontWeight.normal,
                                color: Colors.black
                            ),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 160,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 1,
                              spreadRadius: 1,
                              // offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 6,
                            ),
                            SizedBox(
                              height: 70,
                              child: Image.asset("assets/images/school.png"),),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("Salas de aula",style: TextStyle(
                                fontFamily: SettingsCki.segoeEui,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),),

                            Text("15 Salas de aulas",style: TextStyle(
                                fontFamily: SettingsCki.segoeEui,
                                fontWeight: FontWeight.normal,
                                color: Colors.black
                            ),),
                          ],
                        ),
                      ),

                      Container(
                        width: 160,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 1,
                              spreadRadius: 1,
                              // offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 6,
                            ),
                            SizedBox(
                              height: 70,
                              child: Lottie.asset("assets/jsons/animation_lk17zzfn.json"),),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("Cursos",style: TextStyle(
                                fontFamily: SettingsCki.segoeEui,
                                fontWeight: FontWeight.bold
                            ),),

                            Text("Saíbas sobre cursos",style: TextStyle(
                                fontFamily: SettingsCki.segoeEui,
                                fontWeight: FontWeight.normal
                            ),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 160,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 1,
                              spreadRadius: 1,
                              // offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 6,
                            ),
                            SizedBox(
                              height: 70,
                              child: Lottie.asset("assets/jsons/animation_lk15loaz.json"),),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("Localização",style: TextStyle(
                                fontFamily: SettingsCki.segoeEui,
                                fontWeight: FontWeight.bold
                            ),),

                            Text("Abra o google Map",style: TextStyle(
                                fontFamily: SettingsCki.segoeEui,
                                fontWeight: FontWeight.normal
                            ),),
                          ],
                        ),
                      ),

                      Container(
                        width: 160,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 1,
                              spreadRadius: 1,
                              // offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 6,
                            ),
                            SizedBox(
                              height: 70,
                              child: Lottie.asset("assets/jsons/animation_lk17ycvk.json"),),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("Livros",style: TextStyle(
                                fontFamily: SettingsCki.segoeEui,
                                fontWeight: FontWeight.bold
                            ),),

                            Text("Ler livros",style: TextStyle(
                                fontFamily: SettingsCki.segoeEui,
                                fontWeight: FontWeight.normal
                            ),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10.0),

            GestureDetector(
              onTap: () async {
                //Navigator.push(context, MaterialPageRoute(builder: (context)=> const NovaMatricula()));
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const NewStudent()));

              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8,left: 90,right: 90,bottom: 5),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.blue,
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
                    child: Text("Inscriçoes Abertas",style: TextStyle(
                        fontFamily: SettingsCki.segoeEui,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        fontSize: 16
                    ),),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15.0),

          ],
        ),
      ),
    );
  }

  final List<Dashboard> dashboard = [


    Dashboard(
        image: "assets/images/readingbook.png",
        tittle: "Classes",
        subTittle: "Listagem de classes"
    ),

  ];

  final List<String> imgList = [
    'assets/images/matri.png',
    'assets/images/ckiLogo.png',
    'assets/images/colegio.png',
  ];

}
