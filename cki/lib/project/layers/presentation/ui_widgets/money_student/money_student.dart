


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/configuration/configuration.dart';

class MoneyStudent extends StatefulWidget {
  const MoneyStudent({Key? key}) : super(key: key);

  @override
  State<MoneyStudent> createState() => _MoneyStudentState();
}

class _MoneyStudentState extends State<MoneyStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Área financeira",style: TextStyle(
            color: Colors.orange[900],
            fontFamily: SettingsCki.segoeEui,
            fontSize: 15
        )),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: const Icon(FontAwesomeIcons.graduationCap,color: Colors.black),
          ),
        ),
        actions:  const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(FontAwesomeIcons.moneyBillAlt,color: Colors.green,size: 30,),
          )
        ],


      ),

      ///++++++ DRAWER +++++
      drawer: Drawer(
        elevation: 1,
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, int index) {
              return Column(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: Text("User profile", style: TextStyle(fontFamily: SettingsCki.segoeEui)),
                    accountEmail: const Text("user without email address"),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: Text('Configuração',
                      style: TextStyle(fontFamily: SettingsCki.segoeEui),
                    ),
                    onTap: () {

                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(
                      Icons.star_border,
                      color: Colors.orange,
                    ),
                    title: Text(
                      'Favoritos',
                      style: TextStyle(fontFamily: SettingsCki.segoeEui),
                    ),
                    onTap: () {

                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.account_balance),
                    title: Text('Minha Conta',
                      style: TextStyle(fontFamily: SettingsCki.segoeEui),
                    ),
                    onTap: (){

                    },
                    // Users(userId: UserModel.userId)
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.notifications),
                    title: Text('Notificações',
                      style: TextStyle(fontFamily: SettingsCki.segoeEui),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: (){

                    },
                    leading: const Icon(Icons.privacy_tip),
                    title: Text('Privacidade',
                      style: TextStyle(fontFamily: SettingsCki.segoeEui),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: Text(
                      'Sair',
                      style: TextStyle(fontFamily: SettingsCki.segoeEui),
                    ),
                    onTap: () {

                    },
                  ),

                  const Divider(),
                ],
              );
            }),
      ),

      body: const SingleChildScrollView(

      ),
    );
  }
}
