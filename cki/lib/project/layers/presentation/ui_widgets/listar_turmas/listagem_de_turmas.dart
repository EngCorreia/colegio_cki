
import 'package:flutter/material.dart';

import '../../../core/configuration/configuration.dart';

class ListagemDeTurmas extends StatefulWidget {
  const ListagemDeTurmas({Key? key}) : super(key: key);
  @override
  State<ListagemDeTurmas> createState() => _ListagemDeTurmasState();
}

class _ListagemDeTurmasState extends State<ListagemDeTurmas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Lista das turmas"),
      ),

      body: ListView.builder(
             itemCount: 8,
            itemBuilder: (context,index) => turmas()
        ),

    );
  }


  Widget turmas(){
    return  GestureDetector(
      //onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> const Teachers())),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 160,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 1,
                spreadRadius: 1,
                // offset: const Offset(2, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  // backgroundColor: Colors.transparent,
                  child: Image.asset("assets/images/image.png"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Professores",style: TextStyle(
                    fontFamily: SettingsCki.segoeEui,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8,bottom: 8),
                child: Text("Conheça nossos prof..",style: TextStyle(
                    fontFamily: SettingsCki.segoeEui,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
