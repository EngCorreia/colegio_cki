
import 'dart:developer';

import 'package:cki/project/layers/core/configuration/configuration.dart';
import 'package:cki/project/layers/presentation/ui_widgets/estatistica_financas/transfer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../domain/entities/pagamento_entity/pagamento_entity.dart';
import '../../controllers/financa_aluno_controller/financa_alunos_controller.dart';

class AlunoEstisticaFinancas extends StatefulWidget {
  final String idAluno;
  final String studentName;

  const AlunoEstisticaFinancas({super.key, required this.idAluno, required this.studentName});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<AlunoEstisticaFinancas> {
  int _selectedItemIndex = 2;
  var financa = AreaFinanceiraAluno();

  @override
  void initState() {
    super.initState();
    financa.readControlFinance(studentId: widget.idAluno);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*bottomNavigationBar: Row(
        children: [
          buildNavBarItem(Icons.home, 0),
          buildNavBarItem(Icons.card_giftcard, 1),
          buildNavBarItem(Icons.camera, 2),
          buildNavBarItem(Icons.pie_chart, 3),
          buildNavBarItem(Icons.person, 4),
        ],
      ),
      */
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 300,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0XFF00B686), Color(0XFF00838F)]),
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 20, right: 20.0, top: 30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          Text("Relatório financeiro",
                            style: TextStyle(
                              fontFamily: SettingsCki.segoeEui,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              color: const Color(0XFF00B686),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(.1),
                                    blurRadius: 8,
                                    spreadRadius: 3)
                              ],
                              border: Border.all(
                                width: 1.5,
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            padding: const EdgeInsets.all(5),
                            child: CircleAvatar(
                              child: Image.asset("assets/images/image.png"),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.studentName,
                                style: TextStyle(
                                    fontFamily: SettingsCki.segoeEui,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.camera_front,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),

                                  Observer(builder: (_)=>
                                      RichText(
                                        text: TextSpan(
                                            text: "${NumberFormat.currency(locale: "pt",symbol: "",decimalDigits: 2).format(financa.total)} Kzs",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: SettingsCki.segoeEui,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            children: const [
                                              TextSpan(
                                                  text: ".",
                                                  style: TextStyle(
                                                      color: Colors.white38))
                                            ]),
                                      )
                                  ),

                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  color: Colors.grey.shade100,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 65),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text("Actividades",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),

                        Observer(
                          builder: (_)=> Expanded(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                  itemCount: financa.paymentList.length,
                                  itemBuilder: (context,index){
                                    var pay = financa.paymentList[index];
                                    return paymentUI(payment: pay);
                                  }),
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: 185,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              width: MediaQuery.of(context).size.width * 0.85,
              height: 180,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.05),
                      blurRadius: 8,
                      spreadRadius: 3,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(50),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Total pago",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: SettingsCki.segoeEui,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.arrow_upward,
                                color: Color(0XFF00838F),
                              )
                            ],
                          ),
                          Observer(builder: (_)=>Text(
                            "${NumberFormat.currency(locale: "pt",symbol: "",decimalDigits: 2).format(financa.total)} Kzs",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: SettingsCki.segoeEui,
                                fontSize: 16.0,
                                color: Colors.black87),
                          ))
                        ],
                      ),
                      Container(width: 1, height: 50, color: Colors.grey),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Total não pago",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: SettingsCki.segoeEui,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.arrow_downward,
                                color: Color(0XFF00838F),
                              )
                            ],
                          ),
                          Observer(builder: (_)=>Text(
                            "${NumberFormat.currency(locale: "pt",symbol: "",decimalDigits: 2).format(financa.naoPago)} Kzs",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: SettingsCki.segoeEui,
                                fontSize: 16.0,
                                color: Colors.red),
                          ))
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Observer(builder: (_)=>Text(
                    "Pagou - se um total de ${NumberFormat.currency(locale: "pt",symbol: "",decimalDigits: 2).format(financa.total)} Kzs neste ano",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: SettingsCki.segoeEui,
                      fontStyle: FontStyle.italic,
                    ),
                  ),),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Ver a estatistica periódica de ano 2023/2024",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: SettingsCki.segoeEui,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 1,
                    width: double.maxFinite,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Saíba mais",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: SettingsCki.segoeEui,
                          color: const Color(0XFF00B686)),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


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

  GestureDetector buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 5,
        height: 60,
        decoration: index == _selectedItemIndex
            ? BoxDecoration(
            border:
            Border(bottom: BorderSide(width: 4, color: Colors.green)),
            gradient: LinearGradient(colors: [
              Colors.green.withOpacity(0.3),
              Colors.green.withOpacity(0.016),
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter))
            : BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedItemIndex ? const Color(0XFF00B868) : Colors.grey,
        ),
      ),
    );
  }

  Container buildCategoryCard(
      IconData icon, String title, int amount, int percentage) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      height: 85,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: const Color(0xFF00B686),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blueAccent,
                      fontFamily: SettingsCki.segoeEui,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "$amount kzs",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: SettingsCki.segoeEui
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("($percentage kzs)",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: SettingsCki.segoeEui,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Stack(
            children: [
              Container(
                height: 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.grey.shade300),
              ),
              Container(
                height: 5,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: const Color(0XFF00B686)),
              ),
            ],
          )
        ],
      ),
    );
  }

  GestureDetector buildActivityButton(
      IconData icon, String title, Color backgroundColor, Color iconColor) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => TransferPage())),
      child: Container(
        margin: EdgeInsets.all(10),
        height: 90,
        width: 85,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              style:
              TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
