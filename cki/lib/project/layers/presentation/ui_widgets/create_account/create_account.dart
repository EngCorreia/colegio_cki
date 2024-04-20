


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../controllers/login_controller/login_controller.dart';
import '../login_ui/status.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key, required this.userName, required this.phoneNumber, required this.email});

  final String userName;
  final String phoneNumber;
  final String email;

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: stateRegister(),
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
}
