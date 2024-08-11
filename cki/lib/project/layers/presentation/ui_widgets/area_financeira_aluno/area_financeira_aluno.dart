
import 'package:cki/project/layers/core/configuration/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:asuka/asuka.dart'  as asuka;

import '../../../core/const_strings/user_information.dart';
import '../../controllers/financa_aluno_controller/financa_alunos_controller.dart';
import 'listas_de_despesas.dart';


class FinancasAluno extends StatefulWidget {
  const FinancasAluno({super.key});

  @override
  State<FinancasAluno> createState() => _FinancasAlunoState();
}

class _FinancasAlunoState extends State<FinancasAluno> {

  var financa = AreaFinanceiraAluno();
  String get secondLogo => dotenv.env['LOGO_IMAGE_SECOND']!;
  
  @override
  void initState() {
    super.initState();
    if(StudentInformation.userID!.isNotEmpty){
      financa.leituraFilhosFinancas();
      financa.getPaymentListStudent();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        elevation: 0,
        title: Text("Área Financeira",style: TextStyle(
            color: Colors.white,
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
              child: Image.asset(secondLogo),
            ),
          )
        ],
      ),

      body: StudentInformation.status != 0 ? Observer(
        builder: (_)=>  Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Colors.orange[400],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.people),
                    Text("${financa.paymentList.length} Filho(s)",style: TextStyle(
                        fontFamily: SettingsCki.segoeEui,
                        fontSize: 18,
                        fontWeight: FontWeight.normal
                    ),),

                    Text("Fale conosco ligando",style: TextStyle(
                        fontFamily: SettingsCki.segoeEui,
                        fontSize: 18,
                        fontWeight: FontWeight.normal
                    ),),

                    GestureDetector(
                      onTap: () {
                        customLaunch('+2449516528575');
                        },
                        child: const Icon(Icons.call,color: Colors.cyanAccent,size: 30,)),
                  ],
                ),

              ),
            ),

            Expanded(
              child: financa.paymentList.isEmpty ? const Center(
                child: CircularProgressIndicator()  /*Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.person_off_rounded,size: 70,color: Colors.blue,),
                    Text("Não há nenhum aluno cadastrado",style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: SettingsCki.segoeEui,
                    ),)
                  ],
                )*/,
              ): ListView.builder(
                  itemCount: financa.paymentList.length,
                  itemBuilder: (context,index) => ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> MenuFinanceiroAluno(
                        paymentEntity: financa.paymentList[index],
                      )));
                    },
                    leading: CircleAvatar(
                      // backgroundColor: Colors.transparent,
                      child: Image.asset("assets/images/image.png"),
                    ),
                    title: Text(financa.paymentList[index].name,style: TextStyle(
                      fontFamily: SettingsCki.segoeEui,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black
                    ),),
                    subtitle: Text(financa.paymentList[index].classe,style: TextStyle(
                        fontFamily: SettingsCki.segoeEui,
                        fontWeight: FontWeight.normal,
                        color: Colors.lightBlueAccent
                    ),
                    ),

                    trailing: Observer(
                      builder: (_)=> (financa.paymentList[index].status == 0) ? Stack(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(11),
                            child: Icon(
                              Icons.notifications,
                              size: 26,
                              color: Colors.blueGrey,
                            ),
                          ),
                          Positioned(
                            top: 6,
                            right: 6,
                            child: Container(
                              padding: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 18,
                                minHeight: 18,
                              ),
                              child: const Text(
                                "1",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )

                        ],
                      ): const Text("0",style: TextStyle(
                        color: Colors.white
                      ),),
                    )
                  )
              ),
            ),
          ],
        ),
      ): Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.monetization_on_outlined,size: 60,color: Colors.blueGrey,),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10,left: 10),
              child: Text("Por favor faça login na sua conta Para ter acesso aos pagamentos efectuados e aos recibos",style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                    fontFamily: SettingsCki.segoeEui,
                  color: Colors.black
                ),),
            ),
          ],
        ),
      )
    );
  }

  void customLaunch(command) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: command,
    );
    await launchUrl(launchUri);
  }

}
