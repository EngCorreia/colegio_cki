import 'dart:developer';

import 'package:cki/project/layers/core/configuration/configuration.dart';
import 'package:cki/project/layers/presentation/ui_widgets/area_financeira_aluno/pagamentoInscricao.dart';
import 'package:cki/project/layers/presentation/ui_widgets/area_financeira_aluno/pagamento_livros.dart';
import 'package:cki/project/layers/presentation/ui_widgets/area_financeira_aluno/paymentUniforme.dart';
import 'package:cki/project/layers/presentation/ui_widgets/area_financeira_aluno/propina_atl.dart';
import 'package:cki/project/layers/presentation/ui_widgets/area_financeira_aluno/propina_transport.dart';
import 'package:cki/project/layers/presentation/ui_widgets/area_financeira_aluno/propinas_aluno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../modules/finances/domain/entities/paymentEntity.dart';
import '../../controllers/financa_aluno_controller/financa_alunos_controller.dart';

class MenuFinanceiroAluno extends StatefulWidget {
  final PaymentEntity? paymentEntity;
  const MenuFinanceiroAluno({super.key, required this.paymentEntity});
  @override
  _MenuFinanceiroAlunoState createState() => _MenuFinanceiroAlunoState();
}

class _MenuFinanceiroAlunoState extends State<MenuFinanceiroAluno> {
  var financa = AreaFinanceiraAluno();
  String get uniformLogo => dotenv.env['UNIFORME_LOGO']!;

  @override
  void initState() {
    super.initState();
    financa.getPaymentStudentById(studentId: widget.paymentEntity!.documentId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 230,
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
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Text(
                            "Areas Finceiras",
                            style: TextStyle(
                              fontFamily: SettingsCki.segoeEui,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const Icon(
                            Icons.payment,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
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
                              Text(
                                widget.paymentEntity!.name,
                                style: TextStyle(
                                    fontFamily: SettingsCki.segoeEui,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
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
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  color: Colors.grey.shade100,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Actividades",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: Observer(
                              builder: (_) => financa.paymentEntity != null ? ListView(
                                children: [
                                  inscriptionMonth(),
                                  paymentMonth(),
                                  paymentTransport(),
                                  paymentAtl(),
                                  paymentBooks(),
                                  paymentUniform(),
                                ],
                              ): const Center(
                                  child: SizedBox(
                                    height: 50,
                                      width: 50,
                                      child: CircularProgressIndicator(
                                        color: Colors.grey,
                                      ))),
                            )
                          ),
                        ),
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
        ],
      ),
    );
  }

  Widget inscriptionMonth() {
    return GestureDetector(
      onTap: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PramentoInscricao(
                  idAluno: widget.paymentEntity!.documentId,
                  studentName: widget.paymentEntity!.name,
                )));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.8),
                blurRadius: 8,
              )
            ],
            border: Border.all(
              width: 1.5,
              color: Colors.white10,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
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
                        child: const CircleAvatar(
                          child: Icon(FontAwesomeIcons.userGroup), //assets/course/books.png
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "PAGAMENTO INSCRIÇÃO",
                        style: TextStyle(
                            fontFamily: SettingsCki.segoeEui,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 15),
                      ),
                      Expanded(child: Container()),
                      Stack(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(11),
                            child: Icon(
                              Icons.notifications,
                              size: 26,
                              color: Colors.black54,
                            ),
                          ),
                          financa.inscriptionNotPay.isNotEmpty
                                ? Positioned(
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
                                child: Text(
                                  "${financa.inscriptionNotPay.length}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ): Container(),

                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget paymentMonth() {
    return GestureDetector(
      onTap: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PropinasAluno(
                      idAluno: widget.paymentEntity!.documentId,
                      studentName: widget.paymentEntity!.name,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.8),
                  blurRadius: 8,
                  )
            ],
            border: Border.all(
              width: 1.5,
              color: Colors.white10,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
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
                        child: const CircleAvatar(
                          backgroundImage: AssetImage(
                              "assets/course/calendario.png"), //assets/course/books.png
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),

                      Text(
                        "PROPINAS MENSAIS",
                        style: TextStyle(
                            fontFamily: SettingsCki.segoeEui,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 15),
                      ),
                      Expanded(child: Container()),
                      Stack(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(11),
                            child: Icon(
                              Icons.notifications,
                              size: 26,
                              color: Colors.black54,
                            ),
                          ),
                         financa.monthlyNotPay.isNotEmpty
                                ? Positioned(
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
                                      child: Text(
                                        "${financa.monthlyNotPay.length}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )
                                : Container(),

                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget paymentTransport() {
    return GestureDetector(
      onTap: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PropinasTransport(
                  idAluno: widget.paymentEntity!.documentId,
                  studentName: widget.paymentEntity!.name,
                )));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.8),
                blurRadius: 8,
              )
            ],
            border: Border.all(
              width: 1.5,
              color: Colors.white10,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
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
                        child: const CircleAvatar(
                          backgroundImage: AssetImage(
                              "assets/images/cki_images/bus-min.png"), //assets/course/books.png
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "PAGAMENTO DE TRANSPORTE",
                        style: TextStyle(
                            fontFamily: SettingsCki.segoeEui,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 15),
                      ),

                      Expanded(child: Container()),
                      Stack(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(11),
                            child: Icon(
                              Icons.notifications,
                              size: 26,
                              color: Colors.black54,
                            ),
                          ),
                          financa.transportNotPay.isNotEmpty
                              ? Positioned(
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
                              child: Text(
                                "${financa.transportNotPay.length}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ) : Container(),

                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget paymentAtl() {
    return GestureDetector(
      onTap: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PropinasAtl(
                      idAluno: widget.paymentEntity!.documentId,
                      studentName: widget.paymentEntity!.name,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.8),
                blurRadius: 8,
              )
            ],
            border: Border.all(
              width: 1.5,
              color: Colors.white10,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
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
                        child: const CircleAvatar(
                          backgroundImage: AssetImage(
                              "assets/classRoom/atl_logo.png"), //assets/course/books.png
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "PROPINA DO ATL",
                        style: TextStyle(
                            fontFamily: SettingsCki.segoeEui,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 15),
                      ),

                      Expanded(child: Container()),
                      Stack(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(11),
                            child: Icon(
                              Icons.notifications,
                              size: 26,
                              color: Colors.black54,
                            ),
                          ),
                          financa.atlNotPay.isNotEmpty
                              ? Positioned(
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
                              child: Text(
                                "${financa.atlNotPay.length}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ) : Container(),

                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget paymentBooks() {
    return GestureDetector(
      onTap: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PropinasBooks(
                  idAluno: widget.paymentEntity!.documentId,
                  studentName: widget.paymentEntity!.name,
                )));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.8),
                blurRadius: 8,
              )
            ],
            border: Border.all(
              width: 1.5,
              color: Colors.white10,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
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
                        child: const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/course/books.png"), //
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "PAGAMENTO DE LIVROS",
                        style: TextStyle(
                            fontFamily: SettingsCki.segoeEui,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 15),
                      ),

                      Expanded(child: Container()),
                      Stack(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(11),
                            child: Icon(
                              Icons.notifications,
                              size: 26,
                              color: Colors.black54,
                            ),
                          ),
                          financa.booksNotPay.isNotEmpty
                              ? Positioned(
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
                              child: Text(
                                "${financa.booksNotPay.length}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ) : Container(),

                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget paymentUniform() {
    return GestureDetector(
      onTap: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PropinasUniforme(
                  idAluno: widget.paymentEntity!.documentId,
                  studentName: widget.paymentEntity!.name,
                )));

      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.8),
                blurRadius: 8,
              )
            ],
            border: Border.all(
              width: 1.5,
              color: Colors.white10,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
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
                          backgroundImage:
                              AssetImage(uniformLogo), //
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "PAGAMENTO DE UNIFORME",
                        style: TextStyle(
                            fontFamily: SettingsCki.segoeEui,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 15),
                      ),

                      Expanded(child: Container()),
                      Stack(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(11),
                            child: Icon(
                              Icons.notifications,
                              size: 26,
                              color: Colors.black54,
                            ),
                          ),
                          financa.uniformNotPay.isNotEmpty
                              ? Positioned(
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
                              child: Text(
                                "${financa.uniformNotPay.length}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ) : Container(),

                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
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
                        fontFamily: SettingsCki.segoeEui),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "($percentage kzs)",
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
}
