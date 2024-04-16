import 'dart:developer';

import 'package:cki/project/layers/presentation/ui_widgets/login_ui/status.dart';
import 'package:cki/project/layers/presentation/ui_widgets/login_ui/web_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/configuration/configuration.dart';
import '../../../core/const_strings/user_information.dart';
import '../../controllers/login_controller/login_controller.dart';
import '../../controllers/update_student_collection/update_student_collection.dart';
import '../about_us/about_us.dart';
import '../contacts/contact_ui.dart';
import '../equipe_list/equipe_list.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var status = Status();
  final loginController = GetIt.I.get<LoginController>();
  double screenHeight = 0;
  double screenWidth = 0;
  double bottom = 0;
  String otpPin = " ";
  String countryDial = "+244";
  String verID = " ";
  int screenState = 0;
  Color blue = const Color(0xff8cccff);
  var name = "";


  void verifyUserLogged(){
    var user = FirebaseAuth.instance.currentUser;
    if(user!.uid.isEmpty){
      StudentInformation.name = user.displayName ?? "";
      StudentInformation.userID = user.uid ?? "";
      StudentInformation.phoneNumber = user.phoneNumber ?? "";
      StudentInformation.photo = user.photoURL ?? "";
      log("----- user ID => ${StudentInformation.userID}");
    }
  }


  void userAuth({UserCredential? userCredential}){
   // var user = FirebaseAuth.instance.currentUser;
    StudentInformation.name = userCredential?.user?.displayName;
    StudentInformation.userID = userCredential?.user?.uid ?? "";
    StudentInformation.phoneNumber = userCredential?.user?.phoneNumber ?? "";
    StudentInformation.photo = userCredential?.user?.photoURL ?? "";
  }

  Future<void> verifyPhone(String number) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: number,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) {
        showSnackBarText("Autenticado com sucesso");
        status.setStatus("");
      },
      verificationFailed: (FirebaseAuthException e) {
        showSnackBarText("Autenticação falhou");
        status.setStatus("");
      },
      codeSent: (String verificationId, int? resendToken) {
        showSnackBarText("Código enviado");
        status.setStatus("");
        verID = verificationId;
        setState(() {
          screenState = 1;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        showSnackBarText("Ops o tempo espirou");
      },
    );
  }

  Future<void> verifyOTP() async {
    await FirebaseAuth.instance.signInWithCredential(
      PhoneAuthProvider.credential(verificationId: verID, smsCode: otpPin,),).then((value) async {
        userAuth(userCredential: value);
        var updateStudentCollections = UpdateStudentInformation();
        updateStudentCollections.updateStudent(userId: StudentInformation.userID,name: name);
        final pref = await SharedPreferences.getInstance();
        pref.setString("login", "logged");
        log("**************** ${value.user}");
    });
  }


  @override
  void initState() {
    super.initState();
    verifyUserLogged();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    bottom = MediaQuery.of(context).viewInsets.bottom;

    return PopScope(canPop: false,
      child: Scaffold(
        backgroundColor: Colors.orange[400],
        body: StudentInformation.userID == "" ? SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: screenHeight / 14),
                  child: Column(
                    children: [
                      Center(child: Image.asset("assets/images/logoRemove.png",width: 190,height: 190,)),
                    ],
                  ),
                ),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: circle(5),
              ),
              Transform.translate(
                offset: const Offset(30, -30),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: circle(4.5),
                ),
              ),
              Center(
                child: circle(3),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(
                  height: bottom > 0 ? screenHeight : screenHeight / 2,
                  width: screenWidth,
                  color: Colors.white,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth / 12,
                      right: screenWidth / 12,
                      top: bottom > 0 ? screenHeight / 12 : 0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        screenState == 0 ? stateRegister() : stateOTP(),
                        GestureDetector(
                          onTap: () {
                            if(screenState == 0) {
                              if(usernameController.text.isEmpty) {
                                showSnackBarText("Nome do encarregado vazio");
                              } else if(phoneController.text.isEmpty) {
                                showSnackBarText("Numero de telefone vazio");
                              } else {
                                status.setStatus("start");
                                verifyPhone(countryDial+phoneController.text);
                              }
                            } else {
                              if(otpPin.length >= 6) {
                                status.setStatus("");
                                loginController.loginUser();
                                verifyOTP();
                              } else {
                                showSnackBarText("Introduza o código corretamente");
                              }
                            }
                          },
                          child: Container(
                            height: 50,
                            width: screenWidth,
                            margin: EdgeInsets.only(bottom: screenHeight / 12),
                            decoration: BoxDecoration(
                              color: Colors.blue[900],
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(
                              child: Text("CONTINUA",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ) : ListView(
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 50,
                                child: Image.asset("assets/images/image.png"),
                              ),
                            ),
                          ),

                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Colégio Kalabo Internacional",style: TextStyle(color: Colors.black),),
                            ),
                          ),

                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Telefone : ${StudentInformation.phoneNumber}",style: const TextStyle(color: Colors.black),),
                            ),
                          ),

                        ],
                      ),
                    ),

                  ListTile(
                    leading: const Icon(Icons.home_outlined,color: Colors.white,),
                    title: Text('Sobre nós',
                      style: TextStyle(fontFamily: SettingsCki.segoeEui,
                          color: Colors.white,fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const AboutUs()));

                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.settings,color: Colors.white,),
                    title: Text('Configuração',
                      style: TextStyle(fontFamily: SettingsCki.segoeEui,
                          color: Colors.white,fontWeight: FontWeight.bold),
                    ),
                    onTap: () {

                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(FontAwesomeIcons.userGroup,color: Colors.white,),
                    title: Text('Equipe',
                      style: TextStyle(fontFamily: SettingsCki.segoeEui,
                          color: Colors.white,fontWeight: FontWeight.bold),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const Equipe()));
                    },
                    // Users(userId: UserModel.userId)
                  ),
                  const Divider(),
                  ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const Contact()));
                    },
                    leading: const Icon(Icons.call,color: Colors.white,),
                    title: Text('Contactos',
                      style: TextStyle(fontFamily: SettingsCki.segoeEui,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.file_copy_sharp,color: Colors.white,),
                    title: Text('Politica de privacidade',
                      style: TextStyle(fontFamily: SettingsCki.segoeEui,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                      const WebViewName(baseUrl: "https://colegiocki.blogspot.com/2023/11/privacy-policy-correia-chumbo-built.html",)));
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: Text('Sair', style: TextStyle(fontFamily: SettingsCki.segoeEui,
                        color: Colors.cyanAccent,fontSize: 16,fontWeight: FontWeight.bold),
                    ),
                    onTap: () async {
                      var d = FirebaseAuth.instance;
                      await d.signOut();
                      final pref = await SharedPreferences.getInstance();
                      pref.setBool("showHome", false);
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=> SplashWidgets()));
                    },
                  ),

                ],
              ),
          ],
        ),

      ),
    );
  }

  void showSnackBarText(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  Widget stateRegister() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Nome do encarregado",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8,),
          TextFormField(
            controller: usernameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
            ),
            onChanged: (value){
              name = value;
            },
          ),
          const SizedBox(height: 16,),
          const Text("Número de telefone",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          IntlPhoneField(
              controller: phoneController,
              showCountryFlag: false,
              showDropdownIcon: false,
              initialValue: countryDial,
              onCountryChanged: (country) {
                setState(() {
                  countryDial = "+${country.dialCode}";
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16,),
              ),
            ),


          Observer(builder: (_) {
            if (status.status == null || status.status == "") {
              return Container();
            } else {
              return const Center(child: CupertinoActivityIndicator());
            }
          }),


          Observer(builder: (_) {
            if (status.status == null || status.status == "") {
              return Container();
            } else {
              return const Center(child: Text("Por favor aguarde ...."));
            }
          }),

          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const WebViewName(baseUrl: "https://colegiocki.blogspot.com/2023/11/privacy-policy-correia-chumbo-built.html",)));
            },
            child: const Text("politica de privacidade"),
          )

        ],
      ),
    );
  }

  Widget stateOTP() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              const TextSpan(
                text: "Já enviamos o código para ",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                ),
              ),
              TextSpan(
                text: countryDial + phoneController.text,
                style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const TextSpan(
                text: "\nIntroduza o código aqui e continua...",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20,),
        PinCodeTextField(
          appContext: context,
          length: 6,
          onChanged: (value) {
            setState(() {
              otpPin = value;
            });
          },
          pinTheme: PinTheme(
            activeColor: blue,
            selectedColor: blue,
            inactiveColor: Colors.black26,
          ),
        ),
        const SizedBox(height: 20,),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: "Não recebeu o codigo? ",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 12,
                ),
              ),
              WidgetSpan(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      screenState = 0;
                    });
                  },
                  child: const Text("Reiniciar",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget circle(double size) {
    return Container(
      height: screenHeight / size,
      width: screenHeight / size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }
}
