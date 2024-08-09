import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import '../../../../../views/add_cources/add_course_view.dart';
import '../../../../../views/teacher/list_of_teachers/read_teachers.dart';
import '../../../../../views/teachers/listagem_de_turmas_prof/listagem_turma_view.dart';
import '../../../core/configuration/configuration.dart';
import '../../../core/const_strings/user_information.dart';
import '../../../domain/entities/dashboard_entity/dashboard_entity.dart';
import '../../../services/login_service/login_service.dart';
import '../../controllers/login_controller/controller_login.dart';
import '../../controllers/update_student_collection/update_student_collection.dart';
import '../area_financeira/area_financeira.dart';
import '../area_pedagogica/area_pedagogica.dart';
import '../books/books.dart';
import '../calendary_screen/calendar_screen.dart';
import '../classroom_ui/classroom.dart';
import '../course/screens/product/products_screen.dart';
import '../estatistica_financas/home_estatistica.dart';
import '../googleMap/cki_location.dart';


class MenuWidgets extends StatefulWidget {
  const MenuWidgets({super.key});

  @override
  MenuWidgetsState createState() => MenuWidgetsState();
}

class MenuWidgetsState extends State<MenuWidgets> {
  int _current = 0;
  var dd = UpdateStudentInformation();
  final loginController = LoginControl();
  AuthenticationServe serve = AuthenticationServe();

  Future<void> getState() async {
    StudentInformation.screenState = await serve.getLoginState();
  }

  @override
  void initState() {
    getState();
    super.initState();
    serve.startUpUser();
    if (StudentInformation.status == 1) {
      loginController.loginUserStatus();
    }
  }

  @override
  Widget build(context) {
    final List<Widget> imageSliders = imgList
        .map((item) => ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(5.0),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    item,
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
                      child: const Text('',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ))
        .toList();

    return Scaffold(

      /*
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
                    accountName: Text("${StudentInformation.name}",style: TextStyle(fontFamily: SettingsCki.segoeEui,fontWeight: FontWeight.bold)),
                    accountEmail: Text("geral.cki@gmail.com", style: TextStyle(fontFamily: SettingsCki.segoeEui)),
                  ),
                 /* ListTile(
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

                  */
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
                    leading: Icon(FontAwesomeIcons.userGroup,color: Colors.orange[900],),
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
                  /*
                  ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const Contact()));
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
                    leading: Icon(Icons.file_copy_sharp,color: Colors.orange[900],),
                    title: Text('Politica de privacidade',
                      style: TextStyle(fontFamily: SettingsCki.segoeEui,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    const WebViewName(baseUrl: "https://colegiocki.blogspot.com/2023/11/privacy-policy-correia-chumbo-built.html",)));
                    },
                  ),

                  */
                  ListTile(
                    title: Text('Sair da conta', style: TextStyle(fontFamily: SettingsCki.segoeEui,
                        color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(Icons.exit_to_app,color: Colors.orange[900],),
                    onTap: StudentInformation.status == 0 ? null : () async {

                      showDialog(context: context, builder: (context)=> AlertDialog(
                        title: Text("Aviso ...",style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: SettingsCki.segoeEui
                        ),),
                        content: SizedBox(
                          height: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Pretendes sair da sua conta ?",style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: SettingsCki.segoeEui
                              )),
                              const SizedBox(
                                height: 10,
                              ),

                            ],
                          ),
                        ),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: const Text("NÃO")),

                          TextButton(onPressed: (){
                            serve.logOut();
                            FlutterSnackBar.showTemplated(
                              context,
                              title: 'Sair da conta ....',
                              message: "Conta fechada com sucesso",
                              leading: CircleAvatar(
                                child: Image.asset("assets/images/image.png"),
                              ),
                              // trailing: const Text('trailing!'),

                              style: FlutterSnackBarStyle(
                                margin: const EdgeInsets.symmetric(horizontal: 16),
                                radius: BorderRadius.circular(6),
                                backgroundColor: Colors.blue,
                                shadow: BoxShadow(
                                  color: Colors.black.withOpacity(0.55),
                                  blurRadius: 32,
                                  offset: const Offset(0, 12),
                                  blurStyle: BlurStyle.normal,
                                  spreadRadius: -10,
                                ),
                                leadingSpace: 22,
                                trailingSpace: 12,
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                titleStyle: const TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.w600),
                                messageStyle:
                                const TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.w400),
                                titleAlignment: TextAlign.start,
                                messageAlignment: TextAlign.start,
                                loadingBarColor: Colors.yellow,
                                loadingBarRailColor: Colors.yellow.withOpacity(0.4),
                              ),
                              configuration: const FlutterSnackBarConfiguration(
                                location: FlutterSnackBarLocation.top,
                                distance: 10,
                                animationCurve: Curves.ease,
                                animationDuration: Duration(milliseconds: 500),
                                showDuration: Duration(seconds: 3),
                                persistent: false,
                                dismissible: true,
                                dismissDirection: DismissDirection.horizontal,
                                showLoadingBar: true,
                              ),
                            );

                            Future.delayed(const Duration(seconds: 4),(){
                              Navigator.pop(context);
                            });


                          }, child: const Text("SIM"))
                        ],

                      ));

                    },
                  ),
                  const Divider(),
                ],
              );
            }),
      ),

        */
      //loginController.newStatusUser == 1
      floatingActionButton: Observer(
          builder: (_) => loginController.newStatusUser == 1
              ? FloatingActionButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
                        builder: (context) => buildSheet());
                  },
                  child: const Icon(Icons.add),
                )
              : Container()),

      body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
                CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(
                    autoPlay: true,
                    pageSnapping: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
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
                      color: _current == index
                          ? const Color.fromRGBO(0, 0, 0, 0.9)
                          : const Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "ANO LECTIVO 2024/2025",
                    style: TextStyle(
                        color: Colors.blue,
                        fontFamily: SettingsCki.segoeEui,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProductsScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 0, left: 0, right: 0, bottom: 0),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.blue[900],
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
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              "INSCRIÇÕES ABERTAS",
                              style: TextStyle(
                                  fontFamily: SettingsCki.segoeEui,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
          
              /*
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 3/2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10
                    ),
                    itemBuilder: (_,index) => Container(color: Colors.blue,),
                    itemCount: 7,
                  ),
              ),
            ),

            */

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ReadTeachersView())),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2.3,
                                //height: 155,
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
                                      height: 90,
                                      child:
                                          Image.asset("assets/course/teacher1.png"),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Professores",
                                      style: TextStyle(
                                          fontFamily: SettingsCki.segoeEui,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "Conheça nossos prof..",
                                      style: TextStyle(
                                          fontFamily: SettingsCki.segoeEui,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ProductsScreen())),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2.3,
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
                                      height: 90,
                                      width: MediaQuery.of(context).size.width,
                                      child: Image.asset(
                                        "assets/course/cursos1.png",
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.cover,
                                        filterQuality: FilterQuality.high,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Classe",
                                      style: TextStyle(
                                          fontFamily: SettingsCki.segoeEui,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Saíbas sobre classe",
                                      style: TextStyle(
                                          fontFamily: SettingsCki.segoeEui,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
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
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const CalendarScreen())),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2.3,
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
                                      height: 90,
                                      child: Image.asset(
                                          "assets/classRoom/atl_logo.png"),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Calendario ATL",
                                      style: TextStyle(
                                          fontFamily: SettingsCki.segoeEui,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "Ver calendario",
                                      style: TextStyle(
                                          fontFamily: SettingsCki.segoeEui,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const CalendarScreen())),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2.3,
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
                                      height: 90,
                                      child:
                                          Image.asset("assets/course/calendario.png"),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Calendario",
                                      style: TextStyle(
                                          fontFamily: SettingsCki.segoeEui,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "Ver calendario",
                                      style: TextStyle(
                                          fontFamily: SettingsCki.segoeEui,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ClassRoom())),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 2.3,
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
                                      height: 0,
                                    ),
                                    SizedBox(
                                      height: 90,
                                      width: MediaQuery.of(context).size.width,
                                      child: Image.asset(
                                        "assets/course/sala.jpeg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Salas de aula",
                                      style: TextStyle(
                                          fontFamily: SettingsCki.segoeEui,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "15 Salas de aulas",
                                      style: TextStyle(
                                          fontFamily: SettingsCki.segoeEui,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Books())),
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2.3,
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
                                        height: 90,
                                        child: Image.asset("assets/course/books.png"),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Livros",
                                        style: TextStyle(
                                            fontFamily: SettingsCki.segoeEui,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Ler livros",
                                        style: TextStyle(
                                            fontFamily: SettingsCki.segoeEui,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CkiLocation()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 2.3,
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
                                      height: 90,
                                      child: Lottie.asset(
                                          "assets/jsons/animation_lk15loaz.json"),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Localização",
                                      style: TextStyle(
                                          fontFamily: SettingsCki.segoeEui,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Abra o google Map",
                                      style: TextStyle(
                                          fontFamily: SettingsCki.segoeEui,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12.0),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),

    );
  }

  final List<Dashboard> dashboard = [
    Dashboard(
        image: "assets/images/readingbook.png",
        tittle: "Classes",
        subTittle: "Listagem de classes"),
  ];

  final List<String> imgList = [
    'assets/images/cki2.png',
    'assets/images/cki1.png',
    'assets/images/cki3.png',
    'assets/images/cki4.png',
    'assets/images/cki5.png',
    'assets/images/cki6.png',
    'assets/images/cki7.png',
    'assets/images/cki8.png',
  ];

  buildSheet() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        ListTile(
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddCourseView()));
          },
          leading: ClipOval(
            child: Image.asset(
              "assets/images/colegio.png",
              width: 40,
              height: 40,
            ),
          ),
          title: Text(
            "Atribuição de Classes",
            style: TextStyle(
                fontFamily: SettingsCki.segoeEui,
                color: Colors.blue[900],
                fontWeight: FontWeight.w900,
                fontSize: 18),
          ),
          subtitle: Text(
            "Atribuir classes",
            style: TextStyle(
              fontFamily: SettingsCki.segoeEui,
            ),
          ),
        ),
        const Divider(),
        ListTile(
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ListTeacherClassView()));
          },
          leading: ClipOval(
            child: Image.asset(
              "assets/images/colegio.png",
              width: 40,
              height: 40,
            ),
          ),
          title: Text(
            "Atribuição de notas",
            style: TextStyle(
                fontFamily: SettingsCki.segoeEui,
                color: Colors.blue[900],
                fontWeight: FontWeight.w900,
                fontSize: 18),
          ),
          subtitle: Text(
            "Atribuir notas",
            style: TextStyle(
              fontFamily: SettingsCki.segoeEui,
            ),
          ),
        ),
        const Divider(),

        ListTile(
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AreaPedagogica()));
          },
          leading: ClipOval(
            child: Image.asset(
              "assets/images/colegio.png",
              width: 40,
              height: 40,
            ),
          ),
          title: Text(
            "Alunos Matriculados",
            style: TextStyle(
                fontFamily: SettingsCki.segoeEui,
                color: Colors.blue[900],
                fontWeight: FontWeight.w900,
                fontSize: 18),
          ),
          subtitle: Text(
            "Lista de todos alunos matriculados",
            style: TextStyle(
              fontFamily: SettingsCki.segoeEui,
            ),
          ),
        ),
        const Divider(),
        ListTile(
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AreaFinanceira()));
          },
          leading: ClipOval(
            child: Image.asset(
              "assets/images/money-bag.png",
              width: 40,
              height: 40,
            ),
          ),
          title: Text(
            "Área Financeiras",
            style: TextStyle(
                fontFamily: SettingsCki.segoeEui,
                color: Colors.green[900],
                fontWeight: FontWeight.w900,
                fontSize: 18),
          ),
          subtitle: Text(
            "Lista de cobranças",
            style: TextStyle(
              fontFamily: SettingsCki.segoeEui,
            ),
          ),
        ),
        const Divider(),
        ListTile(
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomePageEst()));
          },
          leading: ClipOval(
            child: Image.asset(
              "assets/images/report.png",
              width: 40,
              height: 40,
            ),
          ),
          title: Text(
            "Relatório Financeiro",
            style: TextStyle(
                fontFamily: SettingsCki.segoeEui,
                color: Colors.green[900],
                fontWeight: FontWeight.w900,
                fontSize: 18),
          ),
          subtitle: Text(
            "Estatistica financeira",
            style: TextStyle(
              fontFamily: SettingsCki.segoeEui,
            ),
          ),
        ),
      ],
    );
  }

  void showSnackBarText(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }
}
