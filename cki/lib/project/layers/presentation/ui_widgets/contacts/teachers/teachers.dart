import 'package:flutter/material.dart';

import '../../../../core/configuration/configuration.dart';

class Teachers extends StatefulWidget {
  const Teachers({Key? key}) : super(key: key);

  @override
  State<Teachers> createState() => _TeachersState();
}

class _TeachersState extends State<Teachers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title:  Container(
          height: 35,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 1,

              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 3,right: 8,top: 5,bottom: 5),
            child: TextFormField(
              decoration: const InputDecoration(
                //icon: Icon(Icons.person),
                border: InputBorder.none,
                //hintText: 'Pesquisar',
                labelText: 'Pesquisar professor',
                prefixIcon: Icon(Icons.search_rounded),
                // errorText: createContactUser.validateName,
              ),

              onChanged: (value) {

              },
              cursorColor: Colors.indigo,
              // validator: createContactUser.validateSalutation,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Image.asset("assets/images/graduate.png"),
            ),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),

            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  mainAxisExtent: 150),
                 itemBuilder: (_, index) {
                return Padding(
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
                                          child: Image.asset("assets/images/graduate.png"),
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
                );
              },
              itemCount: 15,
            ),
          ],
        ),
      ),
    );
  }
}
