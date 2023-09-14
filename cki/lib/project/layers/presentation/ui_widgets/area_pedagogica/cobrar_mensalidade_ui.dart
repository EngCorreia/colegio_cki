import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../core/configuration/configuration.dart';
import '../../../domain/entities/pagamento_entity/pagamento_entity.dart';
import '../../controllers/financa_aluno_controller/financa_alunos_controller.dart';

class CobrancaMensalidade extends StatefulWidget {
  final String idAluno;
  final String fatherId;
  final String studentName;
  const CobrancaMensalidade({super.key, required this.idAluno, required this.fatherId, required this.studentName});

  @override
  State<CobrancaMensalidade> createState() => _CobrancaMensalidadeState();
}


class _CobrancaMensalidadeState extends State<CobrancaMensalidade> {
  var financa = AreaFinanceiraAluno();
  var data;

  @override
  void initState() {
    super.initState();
    data = DateTime.now();
    financa.editControlFinance(studentId: widget.idAluno,fatherId: widget.fatherId);
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
              fontSize: 18,
            fontWeight: FontWeight.bold
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


        floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
          child: const Icon(Icons.add,color: Colors.white,size: 35,),
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

  Widget paymentUI({required Payment payment}){
    return  payment.status != 0 ? GestureDetector(
      onTap: () async {
        showDialog(context: context, builder: (context)=> AlertDialog(
          icon: GestureDetector(
            onTap: ()=> Navigator.pop(context),
              child: Image.asset("assets/images/close-circle.png", width: 45,height: 45,color: Colors.red,)),
          title: Text("MENSALIDADE DE ${payment.date.toDate()}",style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: SettingsCki.segoeEui
          ),),
          content: Container(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Por favor seleciona uma das opções a baixo.",style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    fontFamily: SettingsCki.segoeEui
                )),
                const SizedBox(
                  height: 10,
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Data : ${payment.date.toDate()}",style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontFamily: SettingsCki.segoeEui
                  )),
                ),
              ],
            ),
          ),
          actions: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                GestureDetector(
                  onTap: () async {
                    financa.editControlFinanceStatus(
                      fatherId: widget.fatherId,
                      status: 0,
                      studentId: widget.idAluno,
                      documentId: payment.idDocument!,
                    );
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8,left: 10,right: 10,bottom: 5),
                    child: Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.red,
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
                        child: Text("NÃO PAGA",style: TextStyle(
                            fontFamily: SettingsCki.segoeEui,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            fontSize: 14,
                        ),),
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () async {
                    financa.editControlFinanceStatus(
                      fatherId: widget.fatherId,
                      status: 1,
                      studentId: widget.idAluno,
                      documentId: payment.idDocument!,
                    );
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8,left: 10,right: 10,bottom: 5),
                    child: Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.green,
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
                        child: Text("VALOR PAGO",style: TextStyle(
                            fontFamily: SettingsCki.segoeEui,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          fontSize: 14

                        ),),
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ],

        ));
        //Navigator.push(context, MaterialPageRoute(builder: (context)=> const NovaMatricula()));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8,left: 20,right: 20,bottom: 5),
        child: Container(
          height: 150,
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
                      Text("FT FT001/1-",style: TextStyle(
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
                  Padding(
                    padding: const EdgeInsets.only(top: 8,left: 10,right: 10,bottom: 5),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue[200],
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
                        child: Text("Data: ${payment.date.toDate()}",style: TextStyle(
                            fontFamily: SettingsCki.segoeEui,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16
                        ),),
                      ),
                    ),
                  ),
               // Exemplo de saída: "14 de setembro de 2023"

                  Text("status: Mensalidade de ${payment.idDocument.toString().toUpperCase()} 2023 / 2024  Paga  ",style: TextStyle(
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
        showDialog(context: context, builder: (context)=> AlertDialog(
          icon: GestureDetector(
              onTap: ()=> Navigator.pop(context),
              child: Image.asset("assets/images/close-circle.png", width: 45,height: 45,color: Colors.red,)),
          title: Text("MENSALIDADE DE ${payment.date.toDate()}",style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: SettingsCki.segoeEui
          ),),
          content: Container(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Por favor seleciona uma das opções a baixo.",style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    fontFamily: SettingsCki.segoeEui
                )),
                const SizedBox(
                  height: 10,
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Data : ${payment.date.toDate()}",style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontFamily: SettingsCki.segoeEui
                  )),
                ),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () async {
                    financa.editControlFinanceStatus(
                      fatherId: widget.fatherId,
                      status: 0,
                      studentId: widget.idAluno,
                      documentId: payment.idDocument!,
                    );
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8,left: 10,right: 10,bottom: 5),
                    child: Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.red,
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
                        child: Text("NÃO PAGA",style: TextStyle(
                          fontFamily: SettingsCki.segoeEui,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontSize: 14,
                        ),),
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () async {
                    financa.editControlFinanceStatus(
                      fatherId: widget.fatherId,
                      status: 1,
                      studentId: widget.idAluno,
                      documentId: payment.idDocument!,
                    );
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8,left: 10,right: 10,bottom: 5),
                    child: Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.green,
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
                        child: Text("VALOR PAGO",style: TextStyle(
                            fontFamily: SettingsCki.segoeEui,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            fontSize: 14

                        ),),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],

        ));
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
                      const SizedBox(width: 5,),
                      Text("FT FT001/1-",style: TextStyle(
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

                  Padding(
                    padding: const EdgeInsets.only(top: 8,left: 10,right: 10,bottom: 5),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue[200],
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
                        child: Text("Data: ${payment.date.toDate()}",style: TextStyle(
                            fontFamily: SettingsCki.segoeEui,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16
                        ),),
                      ),
                    ),
                  ),


                  Text("status: Mensalidade de ${payment.idDocument.toString().toUpperCase()} 2023 / 2024  Não Paga  ",style: TextStyle(
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
    );
  }
}

