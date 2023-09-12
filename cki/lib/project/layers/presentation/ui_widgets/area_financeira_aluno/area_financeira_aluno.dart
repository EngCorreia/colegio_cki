import 'package:cki/project/layers/core/configuration/configuration.dart';
import 'package:flutter/material.dart';

class FinancasAluno extends StatefulWidget {
  const FinancasAluno({super.key});

  @override
  State<FinancasAluno> createState() => _FinancasAlunoState();
}

class _FinancasAlunoState extends State<FinancasAluno> {
  
  
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Meus Filhos",style: TextStyle(
          fontFamily: SettingsCki.segoeEui,
          fontWeight: FontWeight.bold
        ),),
      ),
      
      body: SingleChildScrollView(
        child: ListView.builder(
        itemCount: 2,
            itemBuilder: (context,index) => Container()
        ),
      ),
    );
  }
}
