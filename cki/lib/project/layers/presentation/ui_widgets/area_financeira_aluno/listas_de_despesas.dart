import 'package:cki/project/layers/core/configuration/configuration.dart';
import 'package:cki/project/layers/presentation/ui_widgets/area_financeira_aluno/propina_atl.dart';
import 'package:cki/project/layers/presentation/ui_widgets/area_financeira_aluno/propinas_aluno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../controllers/financa_aluno_controller/financa_alunos_controller.dart';

class MenuFinanceiroAluno extends StatefulWidget {
  final String idAluno;
  final String studentName;

  const MenuFinanceiroAluno(
      {super.key, required this.idAluno, required this.studentName});

  @override
  _MenuFinanceiroAlunoState createState() => _MenuFinanceiroAlunoState();
}

class _MenuFinanceiroAlunoState extends State<MenuFinanceiroAluno> {
  var financa = AreaFinanceiraAluno();
  String get uniformLogo => dotenv.env['UNIFORME_LOGO']!;

  @override
  void initState() {
    super.initState();
    financa.readControlFinance(studentId: widget.idAluno);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                widget.studentName,
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
                            child: ListView(
                              children: [
                                paymentMonth(),
                                paymentAtl(),
                                paymentBooks(),
                                paymentUniform(),
                              ],
                            ),
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

  Widget paymentMonth() {
    return GestureDetector(
      onTap: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PropinasAluno(
                      idAluno: widget.idAluno,
                      studentName: widget.studentName,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.circular(8),
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
                            color: Colors.white,
                            fontSize: 16),
                      ),
                      Expanded(child: Container()),
                      Stack(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(11),
                            child: Icon(
                              Icons.notifications,
                              size: 26,
                              color: Colors.white,
                            ),
                          ),
                          Observer(
                            builder: (_) => financa.paymentNaoPago.isNotEmpty
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
                                        "${financa.paymentNaoPago.length}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )
                                : Container(),
                          ),
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
                      idAluno: widget.idAluno,
                      studentName: widget.studentName,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(8),
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
                            color: Colors.white,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        width: 10,
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
        //Navigator.push(context, MaterialPageRoute(builder: (context)=> const NovaMatricula()));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
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
                            color: Colors.white,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        width: 10,
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
        //Navigator.push(context, MaterialPageRoute(builder: (context)=> const NovaMatricula()));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(8),
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
                            color: Colors.white,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        width: 10,
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
