import 'package:flutter/material.dart';

import '../../../core/configuration/configuration.dart';
import '../equipe_details/equipe_details.dart';

class Equipe extends StatefulWidget {
  const Equipe({Key? key}) : super(key: key);

  @override
  State<Equipe> createState() => _EquipeState();
}

class _EquipeState extends State<Equipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Nossa equipa",style: TextStyle(fontFamily: SettingsCki.segoeEui),),
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
        backgroundColor: Colors.transparent,
        onPressed: (){},
        child: Image.asset("assets/images/add-user.png"),
      ),

      body: SingleChildScrollView(
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              mainAxisExtent: 150),
          itemBuilder: (_, index) {
            return teamList(index);
          },
          itemCount: 5,
        ),
      ),
    );
  }


  teamList(int index){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>  ProfilePage()));
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: 50,
          height: 200,
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
              SizedBox(
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
                              child: Image.asset("assets/images/user.png"),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text("Correia Chumbo",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: SettingsCki.segoeEui,
                                    fontSize: 12)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text("Matemática",
                            style: TextStyle(
                                color: Colors.blue,
                                fontFamily: SettingsCki.segoeEui,
                                fontSize: 12),
                          ),

                          Text("1º e 2º classe",
                            style: TextStyle(
                                color: Colors.black54,
                                fontFamily: SettingsCki.segoeEui,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
