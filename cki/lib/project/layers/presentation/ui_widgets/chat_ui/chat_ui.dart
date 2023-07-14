
import 'package:cki/project/layers/core/configuration/configuration.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatUi extends StatefulWidget {
  const ChatUi({Key? key}) : super(key: key);

  @override
  State<ChatUi> createState() => _ChatUiState();
}

class _ChatUiState extends State<ChatUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      elevation: 0,
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
          padding: const EdgeInsets.only(right: 8,top: 5,bottom: 5),
          child: TextFormField(
            decoration: const InputDecoration(
              //icon: Icon(Icons.person),
              border: InputBorder.none,
              //hintText: 'Pesquisar',
              labelText: 'Pesquisar ',
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
               backgroundColor: Colors.white,
              child: Image.asset("assets/images/image.png"),
            ),
          )
        ],

      ),
      body: Column(
        children: [
          Container(
            color: Colors.orange,
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context ,index)=> Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                    color: Colors.orange,
                    height: 70,
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: const <Widget>[
                              CircleAvatar(
                                radius: 28,
                                backgroundColor: Colors.green,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: GestureDetector(
                              child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 26,
                                        child: Image.asset("assets/images/image.png"),
                                      ),
                                    ),

                                  ]
                              ),

                            )
                        ),
                      ],
                    )
                ),
              ),
            ),
          ),

           Padding(
            padding: EdgeInsets.all(10.0),
            child: Align(
            alignment: Alignment.centerLeft,
                child: Text("Conversar",style: TextStyle(color: Colors.black,fontFamily: SettingsCki.segoeEui,fontSize: 16,fontWeight: FontWeight.bold))),
          ),

          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(itemCount: 10,
                  itemBuilder: (context,index)=>
                  ListTile(
                      leading: CircleAvatar(
                       // backgroundColor: Colors.white,
                        radius: 30,
                        child: Image.asset("assets/images/image.png"),
                      ),
                      title: Text("Correia Antonio Chumbo",style: TextStyle(color: Colors.black,fontFamily: SettingsCki.segoeEui),),
                      subtitle: Text("Lingua Portuguesa",style: TextStyle(color: Colors.black54,fontFamily: SettingsCki.segoeEui),),
                    trailing: Icon(FontAwesomeIcons.facebookMessenger,color: Colors.green),
                    ),

              ),
            ),
          ),

        ],
      ),
    );
  }
}
