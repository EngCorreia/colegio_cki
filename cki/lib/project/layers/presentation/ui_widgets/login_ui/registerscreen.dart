import 'dart:developer';
import 'dart:math';

import 'package:cki/project/layers/presentation/ui_widgets/login_ui/status.dart';
import 'package:cki/project/layers/presentation/ui_widgets/login_ui/web_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_snackbar_plus/flutter_snackbar_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../core/configuration/configuration.dart';
import '../../../core/const_strings/user_information.dart';
import '../../../core/local_notification_service/local_notification_service.dart';
import '../../../core/show_toast_message/show_toast_message.dart';
import '../../../data/datasource/api/sms_message.dart';
import '../../../services/login_service/login_service.dart';
import '../../controllers/login_controller/login_controller.dart';
import '../about_us/about_us.dart';
import '../auto_fill.dart';
import '../contacts/contact_ui.dart';
import '../equipe_list/equipe_list.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  NotificationService localNotification = NotificationService();
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
  var email = "";

  Future<void> getState() async {
    StudentInformation.screenState =  await serve.getLoginState();
  }


  Future<bool> getSms({required String phoneNumber,required String code}) async{
    Message ms = Message();
    var response = await ms.messageService(phoneNumber: countryDial+phoneController.text ,code: code);
   return response;
  }

  AuthenticationServe serve = AuthenticationServe();
  @override
  void initState() {
    super.initState();
    getState();
    serve.addListener(() {
      setState(() {});
    });
    //log("----------------- UUID ${StudentInformation.name}");
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    bottom = MediaQuery.of(context).viewInsets.bottom;
    return PopScope(canPop: false,
      child: Scaffold(
        backgroundColor: Colors.orange[400],
        body: StudentInformation.status == 0 ? SingleChildScrollView(
          child: SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: screenHeight / 18),
                    child: Column(
                      children: [
                        Center(child: Image.asset("assets/images/logoRemove.png",width: 190,height: 190,)),
                      ],
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: circle(3.5),
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
                    height: bottom > 0 ? screenHeight : screenHeight / 1.7,
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
                          StudentInformation.screenState == 0 ? loginView() : StudentInformation.screenState == 2 ? createAccount(): stateOTP(),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
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

                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(StudentInformation.name ?? "User name",style: const TextStyle(color: Colors.black),),
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
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=> const AutoFill()));
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
                    title: Text('Sair da conta', style: TextStyle(fontFamily: SettingsCki.segoeEui,
                        color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),
                    ),
                    leading: const Icon(Icons.exit_to_app,color: Colors.white,),
                    onTap: () async {

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

                            Navigator.pop(context);
                          }, child: const Text("SIM")),
                        ],
                      ));

                    },
                  ),



                ],
              ),
          ],
        ),

      ),
    );
  }


  void showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
      ),
    );
  }

  void showSnackBarText(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
      ),
    );
  }


  Widget loginView() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text("LOGIN",
              style: TextStyle(
                color: Colors.blue[900],
                fontWeight: FontWeight.bold,
                fontSize: 30),
            ),
          ),
          const SizedBox(height: 8,),
          /*TextFormField(
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
          ),*/
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
          const SizedBox(height: 25,),
          GestureDetector(
            onTap:  () async {
              if(StudentInformation.screenState == 0) {
                if(phoneController.text.isEmpty) {
                  showSnackBarText("Numero de telefone vazio");
                } else {
                  status.setStatus("start");
                   bool response = await serve.login(phoneNumber: countryDial+phoneController.text);
                   if(response == true || response == false){
                     status.setStatus("");
                   }

                }
              } else if(StudentInformation.screenState == 2){
                if(usernameController.text.isEmpty) {
                  showSnackBarText("Nome do encarregado vazio");
                } else if(phoneController.text.isEmpty) {
                  showSnackBarText("Numero de telefone vazio");
                } else {
                  var code = (Random().nextInt(900000) + 100000).toString();
                  StudentInformation.codeOtp = code;
                  Message ms = Message();
                  ms.messageService(phoneNumber: StudentInformation.phoneNumber! ,code: code);
                  //status.setStatus("start");
                  localNotification.showLocalNotification(
                      CustomNotification(
                          id: 1,
                          title: "Criação de Conta",
                          body: "Enviamos uma CHAVE para o numero ${countryDial+phoneController.text}\nPara validar o sua CONTA Aguarda por favor  ..."
                      ));

                  FlutterSnackBar.showTemplated(
                    context,
                    title: 'Válidação ....',
                    message: "Para validar o sua conta insira esta chave (234640) no ecrã de confirmação",
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
                      showLoadingBar: false,
                    ),
                  );
                  serve.setLoginState(1);
                  setState(() {
                    getState();
                  });
                  // verifyPhone(countryDial+phoneController.text);
                }
              }else{
                if(otpPin.length >= 6) {
                  if(otpPin != StudentInformation.codeOtp){
                    status.setStatus("start");
                    ShowToast.show_error("Codigo inválido por favor digita outro code");
                    Future.delayed(const Duration(seconds: 4),(){
                      status.setStatus("");
                    });

                  }else{
                    status.setStatus("start");
                    bool logged = await serve.createAccount(userName: usernameController.text,
                        email: emailController.text,
                        phoneNumber: countryDial+phoneController.text);
                    if(logged){
                      showSnackBar("Conta criada com sucesso");
                      status.setStatus("");
                      setState(() {});
                    } else{
                      ShowToast.show_error("Já existe uma conta criada com este numero ${countryDial+phoneController.text}");
                      status.setStatus("");
                    }
                  }
                } else {
                  showSnackBarText("Introduza o código corretamente");
                  status.setStatus("");
                }
              }
            },
            child: Container(
              height: 50,
              width: screenWidth,
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: StudentInformation.screenState == 0 ? const Text("CONTINUAR",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    fontSize: 18,
                  ),
                ): const Text("CRIAR CONTA",
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
          const SizedBox(height: 20),

          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const WebViewName(baseUrl: "https://colegiocki.blogspot.com/2023/11/privacy-policy-correia-chumbo-built.html",)));
            },
            child: const Text("Politica de privacidade"),
          ),
          const SizedBox(height: 5),
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: "Não tenho conta criada pretendo : ",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                ),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      serve.setLoginState(2);
                    },
                    child: Text("Criar conta",
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget createAccount() {
    return Column(
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
      
            const Text("Introduza seu email",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: (value){
                email = value;
              },
            ),
      
      
            Observer(builder: (_) {
              if (status.status == null || status.status == "") {
                return Container();
              } else {
                return const Center(child: CupertinoActivityIndicator());
              }
            }),

            /*
            Observer(builder: (_) {
              if (status.status == null || status.status == "") {
                return Container();
              } else {
                return const Center(child: Text("Por favor aguarde ...."));
              }
            }),

            */

      
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const WebViewName(baseUrl: "https://colegiocki.blogspot.com/2023/11/privacy-policy-correia-chumbo-built.html",)));
              },
              child: const Text("politica de privacidade"),
            ),

            const SizedBox(
              height: 10,
            ),

            GestureDetector(
              onTap: ()  async {
                if(StudentInformation.screenState == 0) {
                  if(usernameController.text.isEmpty) {
                    showSnackBarText("Nome do encarregado vazio");
                  } else if(phoneController.text.isEmpty) {
                    showSnackBarText("Numero de telefone vazio");
                  } else {
                    serve.login(phoneNumber: countryDial+phoneController.text);
                    // status.setStatus("start");
                    /* localNotification.showLocalNotification(
                                      CustomNotification(
                                          id: 1,
                                          title: "Criação de Conta",
                                          body: "Enviamos uma notificação para o numero ${countryDial+phoneController.text}\nPara validar o sua conta insira a chava no ecrã de confirmação"
                                      ));
                                  */
                    // verifyPhone(countryDial+phoneController.text);
                  }
                } else if(StudentInformation.screenState == 2){
                  if(usernameController.text.isEmpty) {
                    showSnackBarText("Nome do encarregado vazio");
                  } else if(phoneController.text.isEmpty) {
                    showSnackBarText("Numero de telefone vazio");
                  } else {
                    status.setStatus("start");
                    var code = (Random().nextInt(900000) + 100000).toString();
                    StudentInformation.codeOtp = code;
                     //var response = getSms(phoneNumber: countryDial+phoneController.text ,code: code);
                       Future.delayed(const Duration(seconds: 3),(){
                         localNotification.showLocalNotification(
                             CustomNotification(
                                 id: 1,
                                 title: "Código de valídar Conta",
                                 body: "C.K.I código de válidação de sua consta é : ( $code ).Digita na tela de confirmação"
                             ));
                         status.setStatus("");
                        // print("----------- Msm enviada");
                       });

                    // status.setStatus("start");

                    /*
                    FlutterSnackBar.showTemplated(
                      context,
                      title: 'Válidação ....',
                      message: "Enviamos um código para o numero ( ${countryDial+phoneController.text}). Por favor aguarde ... ..",
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
                        showLoadingBar: false,
                      ),
                    );

                    */
                    serve.setLoginState(1);
                    setState(() {
                      getState();
                    });
                    // verifyPhone(countryDial+phoneController.text);
                  }
                }else{
                  if(otpPin.length >= 6) {
                    status.setStatus("");
                    if(otpPin != StudentInformation.codeOtp){
                      ShowToast.show_error("Codigo invalido por favor digita outro code");
                      //serve.login(context);
                    }else{
                      bool logged = await serve.createAccount(userName: usernameController.text,
                          email: emailController.text,
                          phoneNumber: countryDial+phoneController.text);
                      if(logged){
                        showSnackBar("Conta criada com sucesso");
                        serve.setLoginState(2);
                        setState(() {});
                      } else{
                        serve.setLoginState(2);
                        showSnackBarText("Criação de conta falhou");
                      }
                    }
                  } else {
                    showSnackBarText("Introduza o código corretamente");
                  }
                }
              },
              child: Container(
                height: 50,
                width: screenWidth,
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: StudentInformation.screenState == 0 ? const Text("CONTINUA",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      fontSize: 18,
                    ),
                  ): const Text("CRIAR CONTA",
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

            const SizedBox(height: 20,),

            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Voltar para a pagina de : ",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                    ),
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () {
                          serve.setLoginState(0);
                        },
                        child: Text("Login",
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
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

                      //var code = (Random().nextInt(900000) + 100000).toString();
                     // StudentInformation.codeOtp = code;
                     // Message ms = Message();
                     // ms.messageService(phoneNumber: countryDial+phoneController.text ,code: code);
                      // status.setStatus("start");
                     /* localNotification.showLocalNotification(
                          CustomNotification(
                              id: 1,
                              title: "Código de valídar Conta",
                              body: "A sua chave de valídação é $code Introduza na tela de confirmação"
                          ));*/
                      serve.setLoginState(2);
                     // screenState = 0;
                  },
                  child: const Text("Enviar código novamente",
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

        const SizedBox(height: 20,),
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

        const SizedBox(height: 40),

        InkWell(
          onTap: () async {
            status.setStatus("start");
            if(otpPin.length >= 6) {
              if(otpPin != StudentInformation.codeOtp){
                status.setStatus("");
                ShowToast.show_error("Codigo invalido por favor digita outro code");
                //serve.login(context);
              }else{
                bool logged = await serve.createAccount(userName: usernameController.text,
                    email: emailController.text,
                    phoneNumber: countryDial+phoneController.text);
                if(logged){
                  showSnackBar("Conta criada com sucesso");
                  status.setStatus("");
                  setState(() {});
                } else{
                  ShowToast.show_error("Já existe uma conta criada com este numero ${countryDial+phoneController.text}");
                  status.setStatus("");
                }
              }
            } else {
              showSnackBarText("Introduza o código corretamente");
              status.setStatus("");
            }
          },
          child: Container(
            height: 50,
            width: screenWidth,
            decoration: BoxDecoration(
              color: Colors.blue[900],
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Center(
              child: Text("VALÍDAR O CÓDIGO",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  fontSize: 14,
                ),
              )
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),

        Center(
          child: RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: "Voltar para a pagina de : ",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                ),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      serve.setLoginState(0);
                    },
                    child: Text("Login",
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
