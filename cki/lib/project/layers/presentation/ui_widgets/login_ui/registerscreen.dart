
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/const_strings/user_information.dart';
import '../../controllers/login_controller/Login_controller.dart';
import '../../controllers/update_student_collection/update_student_collection.dart';
import '../index_menu/index_page.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final loginController = GetIt.I.get<LoginController>();
  double screenHeight = 0;
  double screenWidth = 0;
  double bottom = 0;
  String otpPin = " ";
  String countryDial = "+244";
  String verID = " ";
  int screenState = 0;
  Color blue = const Color(0xff8cccff);




  void userAuth({UserCredential? userCredential}){
   // var user = FirebaseAuth.instance.currentUser;
    StudentInformation.name = userCredential?.user?.displayName;
    StudentInformation.userID = userCredential?.user?.uid ?? "";
    StudentInformation.phoneNumber = userCredential?.user?.phoneNumber ?? "";
    StudentInformation.photo = userCredential?.user?.photoURL ?? "";
    log("----- user ID => ${userCredential?.user?.uid}");
  }

  Future<void> verifyPhone(String number) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: number,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) {
        showSnackBarText("Autenticado com sucesso");
      },
      verificationFailed: (FirebaseAuthException e) {
        showSnackBarText("Autenticação falhou");
      },
      codeSent: (String verificationId, int? resendToken) {
        showSnackBarText("Código enviado");
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
        //log("*************** ${value.user?.phoneNumber}");
        userAuth(userCredential: value);
        var dd = UpdateStudentInformation();
        dd.updateStudent(userId: StudentInformation.userID);

        final pref = await SharedPreferences.getInstance();
        pref.setString("login", "logged");
        Navigator.pop(context);
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => IndexPage(),),);
    });
  }
//Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => IndexPage(),),);
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    bottom = MediaQuery.of(context).viewInsets.bottom;

    return WillPopScope(
      onWillPop: () {
        setState(() {
          screenState = 0;
        });
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.orange[400],
        body: SizedBox(
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
                                verifyPhone(countryDial+phoneController.text);
                              }
                            } else {
                              if(otpPin.length >= 6) {
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
                            child: Center(
                              child: Text("CONTINUA",
                                style: GoogleFonts.montserrat(
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Nome do encarregado",
          style: GoogleFonts.montserrat(
            color: Colors.black87,
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
        ),
        const SizedBox(height: 16,),
        Text("Número de telefone",
          style: GoogleFonts.montserrat(
            color: Colors.black87,
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
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
          ),
        ),
      ],
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
              TextSpan(
                text: "Já enviamos o código para ",
                style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontSize: 18,
                ),
              ),
              TextSpan(
                text: countryDial + phoneController.text,
                style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              TextSpan(
                text: "\nIntroduza o código aqui e continua...",
                style: GoogleFonts.montserrat(
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
              TextSpan(
                text: "Não recebeu o codigo? ",
                style: GoogleFonts.montserrat(
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
                  child: Text("Reiniciar",
                    style: GoogleFonts.montserrat(
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
