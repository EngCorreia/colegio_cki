
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  @override
  void initState() {
    super.initState();
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

  Widget paymentUI({required Payment payment}){
    return  payment.status != 0 ? GestureDetector(
      onTap: () async {
        //Navigator.push(context, MaterialPageRoute(builder: (context)=> const NovaMatricula()));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8,left: 20,right: 20,bottom: 5),
        child: Container(
          height: 95,
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
                      const Icon(FontAwesomeIcons.checkCircle,color: Colors.white,size: 30,),
                      // Image.asset("assets/images/close-circle.png", width: 30,height: 30,color: Colors.red,),
                      const SizedBox(width: 18,),
                      Text("FT FT001/1",style: TextStyle(
                          fontFamily: SettingsCki.segoeEui,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16
                      ),),
                      const SizedBox(width: 10,),
                      Text("${payment.value} AOA",style: TextStyle(
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

                  Text("status: Mensalidade Paga  ",style: TextStyle(
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
          height: 95,
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
                      const SizedBox(width: 18,),
                      Text("FT FT001/1",style: TextStyle(
                          fontFamily: SettingsCki.segoeEui,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16
                      ),),
                      const SizedBox(width: 10,),
                      Text("${payment.value} AOA",style: TextStyle(
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
                    child: Text("status: Mensalidade Não paga",style: TextStyle(
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

