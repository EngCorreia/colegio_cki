
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/configuration/configuration.dart';

class Matricula extends StatefulWidget {
  const Matricula({Key? key}) : super(key: key);

  @override
  State<Matricula> createState() => _MatriculaState();
}

class _MatriculaState extends State<Matricula> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[700],
        elevation: 0,
        title: const Text("Fazer inscrições"),
        actions:  [
          GestureDetector(
            onTap: () async {
              final pref = await SharedPreferences.getInstance();
              pref.setBool("showHome", false);
            },
              child: const Icon(Icons.exit_to_app),
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
