
import 'dart:io';

import 'package:cki/project/layers/presentation/ui_widgets/nova_matricula/read_file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

import '../../../core/configuration/configuration.dart';
import '../index_menu/home_page.dart';

class NewStudent extends StatefulWidget {
  const NewStudent({Key? key}) : super(key: key);

  @override
  State<NewStudent> createState() => _NewStudentState();
}

class _NewStudentState extends State<NewStudent> {
  // var controller = PageController();
  final controller = PageController(keepPage: true);
  bool isLastPage = false;
  bool isChecked = false;
  DateTime dateTime = DateTime.now();
  final _textEditingController = TextEditingController();
  List<PlatformFile>? filesList = [];


  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 50),
        child: PageView(
          controller: controller,
          onPageChanged: (index){
            setState(() {
              isLastPage = index == 3;
            });
          },
          children: [

        SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                color: Colors.red,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("TERMOS & CONDIÇÕES",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),),
                  )
              ),

              const SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("1. O CKI - Instituição cuja actividade é da área educacional como objectivo de prestação de serviço do ano lectivo 2022/2023,sendo os serviços ministrados em conformidade com o previsto na Legislação de ensino em vigor,no Regulamento Interno do ",style: TextStyle(
                        fontFamily: SettingsCki.segoeEui,
                        color: Colors.black,
                        fontWeight: FontWeight.normal
                    ),)
                ),
              ),
            ],
          ),
        ),


            SingleChildScrollView(
              child: Column(
                children: [

                  const SizedBox(
                    height: 30,
                  ),

                  Container(
                      color: Colors.red,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("FICHA DE MATRÍCULA",style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),),
                      )
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'UNIDADE ESCOLAR',
                        labelText: 'UNIDADE ESCOLAR',
                        // errorText: createContactUser.validateName,
                      ),

                      onChanged: (value) {

                      },
                      cursorColor: Colors.indigo,
                      // validator: createContactUser.validateSalutation,
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Container(
                      color: Colors.red,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("DADOS PESSOAL DO(A) ALUNO(A)",style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),),
                      )
                  ),


                  const SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        //icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintText: 'Nome do Aluno',
                        labelText: 'Nome do Aluno',
                        prefixIcon: Icon(Icons.person),
                        // errorText: createContactUser.validateName,
                      ),

                      onChanged: (value) {

                      },
                      cursorColor: Colors.indigo,
                      // validator: createContactUser.validateSalutation,
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                    child: TextFormField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        //icon: Icon(Icons.person),
                        border: const OutlineInputBorder(),
                        //prefixIcon: const Icon(Icons.person), // Add prefix icon
                        suffixIcon: IconButton(onPressed: (){
                          _showDate();
                        },
                          icon: const Icon(Icons.calendar_month),),
                        hintText: dateTime.toString(),
                        labelText: "Data de nascimento",
                        // errorText: createContactUser.validateName,
                      ),

                      onChanged: (value) {

                      },
                      cursorColor: Colors.indigo,
                      // validator: createContactUser.validateSalutation,
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                    child: TextFormField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        //icon: Icon(Icons.person),
                        border: const OutlineInputBorder(),
                        //prefixIcon: const Icon(Icons.person), // Add prefix icon

                        hintText: dateTime.toString(),
                        labelText: "RG/Nº de Registro Certidão Nascimento",
                        // errorText: createContactUser.validateName,
                      ),

                      onChanged: (value) {

                      },
                      cursorColor: Colors.indigo,
                      // validator: createContactUser.validateSalutation,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        //icon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                          hintText: 'Endereço',
                          labelText: 'Endereço',
                          prefixIcon: Icon(Icons.add_home_work_outlined)
                        // errorText: createContactUser.validateName,
                      ),

                      onChanged: (value) {

                      },
                      cursorColor: Colors.indigo,
                      // validator: createContactUser.validateSalutation,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        //icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintText: 'Nome da Mãe',
                        labelText: 'Nome da Mãe',
                        prefixIcon: Icon(Icons.person_add_alt),

                        // errorText: createContactUser.validateName,
                      ),

                      onChanged: (value) {

                      },
                      cursorColor: Colors.indigo,
                      // validator: createContactUser.validateSalutation,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        //icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintText: 'Local de trabalho (nome/endereço)',
                        labelText: 'Local de trabalho (nome/endereço)',
                        // errorText: createContactUser.validateName,
                      ),

                      onChanged: (value) {

                      },
                      cursorColor: Colors.indigo,
                      // validator: createContactUser.validateSalutation,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        //icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintText: 'E-mail',
                        labelText: 'E-mail',
                        prefixIcon: Icon(Icons.email),
                        // errorText: createContactUser.validateName,
                      ),

                      onChanged: (value) {

                      },
                      cursorColor: Colors.indigo,
                      // validator: createContactUser.validateSalutation,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        //icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintText: 'Telefone (fixo/celular)',
                        labelText: 'Telefone (fixo/celular)',
                        prefixIcon: Icon(Icons.email),
                        // errorText: createContactUser.validateName,
                      ),
                      onChanged: (value) {
                      },
                      cursorColor: Colors.indigo,
                      // validator: createContactUser.validateSalutation,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        //icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintText: 'Nome do Pai',
                        labelText: 'Nome do Pai',
                        prefixIcon: Icon(Icons.person_add_alt),

                        // errorText: createContactUser.validateName,
                      ),

                      onChanged: (value) {

                      },
                      cursorColor: Colors.indigo,
                      // validator: createContactUser.validateSalutation,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        //icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintText: 'Local de trabalho (nome/endereço)',
                        labelText: 'Local de trabalho (nome/endereço)',
                        // errorText: createContactUser.validateName,
                      ),

                      onChanged: (value) {

                      },
                      cursorColor: Colors.indigo,
                      // validator: createContactUser.validateSalutation,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        //icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintText: 'E-mail',
                        labelText: 'E-mail',
                        prefixIcon: Icon(Icons.email),
                        // errorText: createContactUser.validateName,
                      ),

                      onChanged: (value) {

                      },
                      cursorColor: Colors.indigo,
                      // validator: createContactUser.validateSalutation,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        //icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintText: 'Telefone (fixo/celular)',
                        labelText: 'Telefone (fixo/celular)',
                        prefixIcon: Icon(Icons.email),
                        // errorText: createContactUser.validateName,
                      ),
                      onChanged: (value) {

                      },
                      cursorColor: Colors.indigo,
                      // validator: createContactUser.validateSalutation,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20,bottom: 10),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Responsável legal que assinará o contrato de prestação de serviço com a Escola",style: TextStyle(
                            fontFamily: SettingsCki.segoeEui,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),)
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        //icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintText: 'Nome',
                        labelText: 'Nome',
                        // errorText: createContactUser.validateName,
                      ),

                      onChanged: (value) {

                      },
                      cursorColor: Colors.indigo,
                      // validator: createContactUser.validateSalutation,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        //icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintText: 'Observações',
                        labelText: 'Observações',
                        // errorText: createContactUser.validateName,
                      ),

                      onChanged: (value) {

                      },
                      cursorColor: Colors.indigo,
                      // validator: createContactUser.validateSalutation,
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),


            SingleChildScrollView(
              child: Column(
                children: [

                  const SizedBox(
                    height: 30,
                  ),


                  Container(
                      color: Colors.red,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("DADOS DE SAÚDE DO(A) ALUNO(A)",style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),),
                      )
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        //icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintText: 'É dependente em plano de saúde?Qual?',
                        labelText: 'É dependente em plano de saúde?Qual?',
                        // errorText: createContactUser.validateName,
                      ),

                      onChanged: (value) {

                      },
                      cursorColor: Colors.indigo,
                      // validator: createContactUser.validateSalutation,
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                    child: TextFormField(
                      controller: _textEditingController,
                      decoration: const InputDecoration(
                        //icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintText: 'Tem algum problema de saúde crônico?',
                        labelText: 'Tem algum problema de saúde crônico?',
                        // errorText: createContactUser.validateName,
                      ),

                      onChanged: (value) {

                      },
                      cursorColor: Colors.indigo,
                      // validator: createContactUser.validateSalutation,
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                    child: TextFormField(
                      controller: _textEditingController,
                      decoration: const InputDecoration(
                        //icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        //prefixIcon: const Icon(Icons.person), // Add prefix icon
                        hintText: "Tem alergia(s)? Qual?",
                        labelText: "Tem alergia(s)? Qual?",
                        // errorText: createContactUser.validateName,
                      ),

                      onChanged: (value) {

                      },
                      cursorColor: Colors.indigo,
                      // validator: createContactUser.validateSalutation,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        //icon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                          hintText: 'Já recebeu diagnóstico médico de deficiência?Qual?',
                          labelText: 'Já recebeu diagnóstico médico de deficiência?Qual?',
                        // errorText: createContactUser.validateName,
                      ),
                      onChanged: (value) {
                      },
                      cursorColor: Colors.indigo,
                      // validator: createContactUser.validateSalutation,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        //icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintText: 'Apresenta alguma dificuldade motora',
                        labelText: 'Apresenta alguma dificuldade motora',
                        // errorText: createContactUser.validateName,
                      ),

                      onChanged: (value) {

                      },
                      cursorColor: Colors.indigo,
                      // validator: createContactUser.validateSalutation,
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 10),
                    child: Row(
                      children: [
                        Text("Está em tratamento médico?"),
                        Text("Não"),
                        Checkbox(value: isChecked,
                            onChanged: (bool? value){
                          setState(() {
                            isChecked = value!;
                          });
                        }),

                        Text("Sim"),
                        Checkbox(value: isChecked,
                            onChanged: (bool? value){
                              setState(() {
                                isChecked = value!;
                              });
                            }),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                        child: Text("Está em uso de alguma medicação?")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 10),
                    child: Row(
                      children: [
                       // Text("Está em uso de alguma medicação?"),
                        const Text("Não"),
                        Checkbox(value: isChecked,
                            onChanged: (bool? value){
                              setState(() {
                                isChecked = value!;
                              });
                            }),

                        Text("Sim"),
                        Checkbox(value: isChecked,
                            onChanged: (bool? value){
                              setState(() {
                                isChecked = value!;
                              });
                            }),
                      ],
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("As vacinas do calendário de vacinação do Ministério da Saúde estão em dia?")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 10),
                    child: Row(
                      children: [
                        // Text("Está em uso de alguma medicação?"),
                        const Text("Não"),
                        Checkbox(value: isChecked,
                            onChanged: (bool? value){
                              setState(() {
                                isChecked = value!;
                              });
                            }),

                        Text("Sim"),
                        Checkbox(value: isChecked,
                            onChanged: (bool? value){
                              setState(() {
                                isChecked = value!;
                              });
                            }),
                      ],
                    ),
                  ),




                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        //icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintText: 'Em caso de emergência a quem ligar?',
                        labelText: 'Em caso de emergência a quem ligar?',
                        // errorText: createContactUser.validateName,
                      ),

                      onChanged: (value) {

                      },
                      cursorColor: Colors.indigo,
                      // validator: createContactUser.validateSalutation,
                    ),
                  ),


                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),


            SingleChildScrollView(
              child: Column(
                children: [

                  const SizedBox(
                    height: 40,
                  ),

                  Container(
                      color: Colors.red,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("DADOS COMPLEMENTARES DO(A) ALUNO(A)",style: TextStyle(
                            color: Colors.white,
                            fontSize: 16
                        ),),
                      )
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                    child: Text("Outras pessoas autorizadas a realizar a condução e a acompanhamento do(a) aluno(a) na chegada e saída da escola",style: TextStyle(
                        color: Colors.black,
                        fontSize: 14
                    ),),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        //icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintText: 'Nome',
                        labelText: 'Nome',
                        prefixIcon: Icon(Icons.person),
                        // errorText: createContactUser.validateName,
                      ),

                      onChanged: (value) {

                      },
                      cursorColor: Colors.indigo,
                      // validator: createContactUser.validateSalutation,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        //icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintText: 'Telefone (fixo/celular)',
                        labelText: 'Telefone (fixo/celular)',
                        prefixIcon: Icon(Icons.call),

                        // errorText: createContactUser.validateName,
                      ),

                      onChanged: (value) {

                      },
                      cursorColor: Colors.indigo,
                      // validator: createContactUser.validateSalutation,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        //icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintText: 'Nome',
                        labelText: 'Nome',
                        prefixIcon: Icon(Icons.person),
                        // errorText: createContactUser.validateName,
                      ),

                      onChanged: (value) {

                      },
                      cursorColor: Colors.indigo,
                      // validator: createContactUser.validateSalutation,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        //icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintText: 'Telefone (fixo/celular)',
                        labelText: 'Telefone (fixo/celular)',
                        prefixIcon: Icon(Icons.call),
                        // errorText: createContactUser.validateName,
                      ),
                      onChanged: (value) {
                      },
                      cursorColor: Colors.indigo,
                      // validator: createContactUser.validateSalutation,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        //icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintText: 'Nome',
                        labelText: 'Nome',
                        prefixIcon: Icon(Icons.person),
                        // errorText: createContactUser.validateName,
                      ),
                      onChanged: (value) {
                      },
                      cursorColor: Colors.indigo,
                      // validator: createContactUser.validateSalutation,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 20),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        //icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintText: 'Telefone (fixo/celular)',
                        labelText: 'Telefone (fixo/celular)',
                        prefixIcon: Icon(Icons.call),
                        // errorText: createContactUser.validateName,
                      ),
                      onChanged: (value) {
                      },
                      cursorColor: Colors.indigo,
                      // validator: createContactUser.validateSalutation,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Através da entrega desta ficha abaixo assinada solicito a matrícula do aluno MATEUS DA COSTA\Nna Escola Sesc COLEGIO KALABO INTERNACIONAL,",style: TextStyle(
                            fontFamily: SettingsCki.segoeEui,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),)
                    ),
                  ),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20,top: 40),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("no grupo",style: TextStyle(
                                fontFamily: SettingsCki.segoeEui,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),)
                        ),
                      ),

                      const SizedBox(width: 15,),

                      Container(
                        width: 230,
                        child: TextFormField(
                        onChanged: (value) {
                          },
                          cursorColor: Colors.indigo,
                        ),
                      )
                    ],
                  ),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20,top: 40),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("do Ensino Fundamental para o ano lectivo de",style: TextStyle(
                                fontFamily: SettingsCki.segoeEui,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),)
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),

                      SizedBox(
                        width: 45,
                        child: TextFormField(
                          onChanged: (value) {
                          },
                          cursorColor: Colors.indigo,
                        ),
                      )
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("ciente de que para efectivação da matrícula são INDISPENSÁVEIS o pagamento da 1º mensalidade e a assinatura de contrato de prestação de serviços educacionais.",style: TextStyle(
                            fontFamily: SettingsCki.segoeEui,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Neste ato informo que estou ciente dos valores a serem pagos e dos termos contidos no contrato a ser assinado.",style: TextStyle(
                            fontFamily: SettingsCki.segoeEui,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Declaro serem verdadeiras todas as informações por mim prestados nesta ficha de matrícula e informo ser o responsável legal pelo(a) aluno(a).",style: TextStyle(
                            fontFamily: SettingsCki.segoeEui,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),)
                    ),
                  ),


                  /*
                  Padding(
                    padding: const EdgeInsets.only(left: 20,bottom: 10),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Por favor anexa uma cópia da declaração",style: TextStyle(
                            fontFamily: SettingsCki.segoeEui,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold
                        ),)
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Por favor anexa a cópia da cedula ou B.I",style: TextStyle(
                          fontFamily: SettingsCki.segoeEui,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),

                    Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                    child: Row(
                      children: [
                        IconButton(onPressed: () async {
                          final result = FilePicker.platform.pickFiles( allowMultiple: true,
                              type: FileType.custom,
                              allowedExtensions: ["pdf","png","jpg"]);
                          if(result == false) return;
                          await result.then((value){
                            setState(() {
                              filesList = value?.files;
                            });
                          });
                        },
                            icon: Image.asset("assets/images/attached.png")),
                        Text("Anexos")
                      ],
                    ),
                  ),


                  (filesList?.length != 0) ? Container(
                    height: 160,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 4.0,
                          mainAxisExtent: 150),
                      itemBuilder: (_, index) {
                        var files = filesList![index];
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            width: 70,
                            height: 1900,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black45,
                                    blurRadius: 1,
                                  )
                                ]),
                            child: Column(
                              children: [
                                // grid_images(index),
                                buildFile(files),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: filesList!.length,
                    ),
                  ):Container(),

                  */

                  const SizedBox(
                    height: 20,
                  ),

                ],
              ),
            ),
          ],
        ),
      ),

      bottomSheet: isLastPage ? Container(
        height: 50,
        child: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              minimumSize: const Size.fromHeight(800),
              backgroundColor: Colors.orange[900]
          ),
          onPressed: () async {
            final pref = await SharedPreferences.getInstance();
            pref.setBool("showHome", true);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> IndexPage()));
          },
          child: Text("COMEÇAR",style: TextStyle(
              color: Colors.white,
              fontFamily: SettingsCki.segoeEui
          ),),
        ),
      ) : Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            TextButton(onPressed: (){
              controller.jumpToPage(0);
            }, child: Text("SALTAR"),),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count:3,
                effect: WormEffect(
                  spacing: 16,
                  dotColor: Colors.blue,
                  activeDotColor: Colors.red.shade700,
                ),
                onDotClicked: (index) => controller.animateToPage(index,
                    duration: const Duration(
                        milliseconds: 500
                    ),
                    curve: Curves.easeIn),
              ),
            ),

            TextButton(onPressed: (){
              controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
            }, child: Text("COMEÇAR"),),

          ],
        ),
      ),
    );
  }

  _showDate(){
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    ).then((value){
      setState(() {
        dateTime = value!;
        _textEditingController.text = value.toString();
      });
    });
  }

  openFile(Future<PlatformFile?> file) {
    var path;
    file.then((value) => path = value?.path);
    OpenFile.open(path!);
  }

  Future<File> saveFie(Future<PlatformFile?> file) async{
    var name;
    var path;
    file.then((value){
      name = value?.name;
      path = value?.path;
    });
    final storage = await getApplicationDocumentsDirectory();
    final newFile = File("${storage.path}/$name");
    return File(path).copy(newFile.path);
  }

  void openFiles(List<PlatformFile> file) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> FilesPage(
      files: file,
      // onOpenedFile: openFile,
    )));
  }

  Widget buildFile(PlatformFile file){
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final fileSize = mb >= 1 ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} KB';
    final extension = file.extension ?? 'none';
    //final color = getColor(extension);
    return InkWell(
      onTap: (){
        OpenFile.open(file.path);
      },
      child: SizedBox(
          child: Padding(
            padding:
            const EdgeInsets.all(0.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    // width: MediaQuery.of(context).size.width,
                    child: CircleAvatar(
                      radius: 35,
                      child: Image.asset("assets/images/folder.png"),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(file.extension.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: SettingsCki.segoeEui,
                            fontSize: 12)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(file.name.toString(),
                    style: TextStyle(
                        color: Colors.blue,
                        fontFamily: SettingsCki.segoeEui,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}