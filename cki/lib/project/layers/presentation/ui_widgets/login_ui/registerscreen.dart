import 'dart:math';
import 'package:cki/project/layers/presentation/ui_widgets/login_ui/status.dart';
import 'package:cki/project/layers/presentation/ui_widgets/login_ui/web_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_snackbar_plus/flutter_snackbar_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../core/configuration/configuration.dart';
import '../../../core/const_strings/user_information.dart';
import '../../../core/local_notification_service/local_notification_service.dart';
import '../../../data/datasource/api/sms_message.dart';
import '../../../services/login_service/login_service.dart';
import '../../controllers/login_controller/login_controller.dart';

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
  Message ms = Message();
  AuthenticationServe serve = AuthenticationServe();

  Future<void> getState() async {
    StudentInformation.screenState =  await serve.getLoginState();
  }

  @override
  void initState() {
    super.initState();
    getState();
    serve.addListener(() {
      setState(() {});
    });

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


                  /*
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
                  */
                  ListTile(
                    leading: const Icon(Icons.settings,color: Colors.white,),
                    title: Text('Configuração',
                      style: TextStyle(fontFamily: SettingsCki.segoeEui,
                          color: Colors.white,fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                     // await ms.notifyUserSms(phoneNumber: "+244924948647", msn: "Welcome to colégio Kalabo Internacional, we thank for your presence in our place and we hope to see you very soon.\n..................................\nBem-vindos ao COLÉGIO KALABO INTERNACIONAL, agradecemos pela sua presença nas nossas instalações e esperamos voltar a vê-lo (a) em breve.\nContinuação de um ótimo dia.");
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=> const AutoFill()));
                    },
                  ),

                  /*
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
                  */
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.file_copy_sharp,color: Colors.white,),
                    title: Text('Terms and Privacy',
                      style: TextStyle(fontFamily: SettingsCki.segoeEui,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                      const WebViewName(baseUrl: "https://trilha-missionaria-iasd.blogspot.com/p/politica-de-privacidade.html",)));
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

  showSnackBarAlert(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SizedBox(
          height: 50,
          child: Center(
            child: Text(text,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: SettingsCki.segoeEui),
            ),
          ),
        ),
        backgroundColor: Colors.red[800],
        duration: const Duration(seconds: 4),

      ),
    );
  }

   showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SizedBox(
          height: 50,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontFamily: SettingsCki.segoeEui
              ),
            ),
          ),
        ),
        backgroundColor: Colors.lightGreen,
        duration: const Duration(seconds: 4),

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
          const Text("Phone number",
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
                if(phoneController.text.isEmpty) {
                  //showSnackBarText();
                  showSnackBarAlert("Numero de telefone vazio");
                } else {
                  status.setStatus("start");
                   var response = await serve.login(phoneNumber: countryDial+phoneController.text);
                   if(response.isNotEmpty){
                     status.setStatus("");
                     if(response != "Usuario logado com sucesso"){
                       showSnackBarAlert(response);
                     }else{
                       showSnackBar(response);
                     }
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
              child: const Center(
                child: Text("CONTINUATION",
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
            child: const SizedBox(
                height: 20,
                child: Text("Terms and Privacy"),),
          ),
          const SizedBox(height: 5),
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: "Create new account: ",
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
                    child: Text("Create now",
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
            const Text("User name",
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
            const Text("Phone number",
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
      
            const Text("Email",
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


            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const WebViewName(baseUrl: "https://trilha-missionaria-iasd.blogspot.com/p/politica-de-privacidade.html",)));
              },
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Terms and Privacy"),
              ),
            ),

            // 954  42  76  80
            GestureDetector(
              onTap: ()  async {
                  if(usernameController.text.isEmpty) {
                    //howSnackBarAlert(String text)
                    showSnackBarText("Nome do encarregado vazio");
                  } else if(phoneController.text.isEmpty) {
                    showSnackBarText("Numero de telefone vazio");
                  } else {
                    status.setStatus("start");
                    var code = (Random().nextInt(900000) + 100000).toString();
                    StudentInformation.codeOtp = code;
                     var res = await ms.sendSms(phoneNumber: countryDial+phoneController.text ,code: code);
                     if(res == true){
                       status.setStatus("");
                     }else{
                       status.setStatus("");
                     }
                       Future.delayed(const Duration(seconds: 2),(){
                         serve.setLoginState(1);
                       });

                    setState(() {
                      getState();
                    });
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
                  child: Text("CREATE ACCOUNT",
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
                      text: "Go back to: ",
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
                      serve.setLoginState(2);
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
                showSnackBarAlert("Codigo invalido por favor digita outro code");
                //serve.login(context);
              }else{
                bool account = await serve.createAccount(userName: usernameController.text,
                    email: emailController.text,
                    phoneNumber: countryDial+phoneController.text);
                if(account){
                  showSnackBar("Conta criada com sucesso");
                  await ms.notifyUserSms(phoneNumber: countryDial+phoneController.text, msn: "Welcome to colégio Kalabo Internacional, we thank for your presence in our place and we hope to see you very soon.\n..................................\nBem-vindos ao COLÉGIO KALABO INTERNACIONAL, agradecemos pela sua presença nas nossas instalações e esperamos voltar a vê-lo (a) em breve.\nContinuação de um ótimo dia.");
                  status.setStatus("");
                  setState(() {});
                } else{
                  showSnackBarAlert("Já existe uma conta criada com este numero ${countryDial+phoneController.text}");
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
