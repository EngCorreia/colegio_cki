


import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/configuration/configuration.dart';
import '../../../domain/entities/pagamento_entity/pagamento_entity.dart';
import '../../controllers/financa_aluno_controller/financa_alunos_controller.dart';

class MoneyStudent extends StatefulWidget {
  final String idAluno;
  final String studentName;
  const MoneyStudent({Key? key, required this.idAluno, required this.studentName}) : super(key: key);

  @override
  State<MoneyStudent> createState() => _MoneyStudentState();
}

class _MoneyStudentState extends State<MoneyStudent> {
  var financa = AreaFinanceiraAluno();

  @override
  void initState() {
    super.initState();
    financa.readControlFinance(studentId: widget.idAluno);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        elevation: 0,
        title: Text(widget.studentName,style: TextStyle(
            color: Colors.white,
            fontFamily: SettingsCki.segoeEui,
            fontSize: 18
        )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Image.asset("assets/images/image.png"),
            ),
          )
        ],
      ),

      body: Observer(
        builder: (_)=>ListView.builder(
            itemCount: financa.paymentList.length,
            itemBuilder: (context,index){
              var pay = financa.paymentList[index];
              return paymentUI(payment: pay);
            }),
      )
    );
  }
  /*GestureDetector(
              onTap: () async {
                //Navigator.push(context, MaterialPageRoute(builder: (context)=> const NovaMatricula()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8,left: 20,right: 20,bottom: 5),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),

                  ),
                  child: Center(
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/images/close-circle.png", width: 30,height: 30,color: Colors.red,),
                              const SizedBox(width: 18,),
                              Text("FT FT001/1",style: TextStyle(
                                  fontFamily: SettingsCki.segoeEui,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16
                              ),),
                              const SizedBox(width: 10,),
                              Text("30.000,00 AOA",style: TextStyle(
                                  fontFamily: SettingsCki.segoeEui,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16
                              ),),
                              const SizedBox(width: 30,),

                              const Icon(FontAwesomeIcons.download,color: Colors.white,)
                            ],
                          ),

                          Text("Data de emissão: 2023-09-12",style: TextStyle(
                              fontFamily: SettingsCki.segoeEui,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontSize: 16
                          ),),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),*/
  Widget paymentUI({required Payment payment}){
    return  payment.status != 0 ? GestureDetector(
      onTap: () async {
        //Navigator.push(context, MaterialPageRoute(builder: (context)=> const NovaMatricula()));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8,left: 20,right: 20,bottom: 5),
        child: Container(
          height: 130,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(8),

          ),
          child: Center(
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(FontAwesomeIcons.circleCheck,color: Colors.white,size: 30,),
                      // Image.asset("assets/images/close-circle.png", width: 30,height: 30,color: Colors.red,),
                      const SizedBox(width: 5,),
                      Text("FT FT001/1",style: TextStyle(
                          fontFamily: SettingsCki.segoeEui,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16
                      ),),
                      const SizedBox(width: 10,),
                     Text("${NumberFormat.currency(locale: "pt",symbol: "",decimalDigits: 2).format(payment.value)} AOA",style: TextStyle(
                          fontFamily: SettingsCki.segoeEui,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16
                      ),),
                      const SizedBox(width: 15,),

                      const Icon(FontAwesomeIcons.download,color: Colors.white,)
                    ],
                  ),

                  Text("Data: ${payment.date.toDate()}",style: TextStyle(
                      fontFamily: SettingsCki.segoeEui,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 16
                  ),),

                  Text("status: Mensalidade de ${payment.idDocument.toString().toUpperCase()} 2023 / 2024 Paga",style: TextStyle(
                      fontFamily: SettingsCki.segoeEui,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18
                  ),),
                ],
              ),
            ),
          ),
        ),
      ),
    ):GestureDetector(
      onTap: () async {
        //Navigator.push(context, MaterialPageRoute(builder: (context)=> const NovaMatricula()));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8,left: 20,right: 20,bottom: 5),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.red[900],
            borderRadius: BorderRadius.circular(8),

          ),
          child: Center(
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                     Image.asset("assets/images/close-circle.png", width: 30,height: 30,color: Colors.white,),
                      // Image.asset("assets/images/close-circle.png", width: 30,height: 30,color: Colors.red,),
                      const SizedBox(width: 8,),
                      Text("FT FT001/1",style: TextStyle(
                          fontFamily: SettingsCki.segoeEui,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16
                      ),),
                      const SizedBox(width: 1,),
                      Text("${NumberFormat.currency(locale: "pt",symbol: "",decimalDigits: 2).format(payment.value)} AOA",style: TextStyle(
                          fontFamily: SettingsCki.segoeEui,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16
                      ),),
                      const SizedBox(width: 30,),

                      const Icon(FontAwesomeIcons.download,color: Colors.white,)
                    ],
                  ),

                  Text("Data: ${payment.date.toDate()}",style: TextStyle(
                        fontFamily: SettingsCki.segoeEui,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        fontSize: 16
                    ),),


                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text("status: Mensalidade de ${payment.idDocument.toString().toUpperCase()} 2023 / 2024 Não paga",style: TextStyle(
                        fontFamily: SettingsCki.segoeEui,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18
                    ),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
