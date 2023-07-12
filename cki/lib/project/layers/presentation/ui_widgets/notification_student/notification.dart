
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/configuration/configuration.dart';

class NotificationUi extends StatefulWidget {
  const NotificationUi({Key? key}) : super(key: key);

  @override
  State<NotificationUi> createState() => _NotificationUiState();
}

class _NotificationUiState extends State<NotificationUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Notificações",style: TextStyle(
        color: Colors.orange[900],
        fontFamily: SettingsCki.segoeEui,
        fontSize: 15
        )),
          leading:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: const Icon(FontAwesomeIcons.graduationCap,color: Colors.black),
            ),
          ),
          actions:  [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                 backgroundColor: Colors.grey[300],
                child: Icon(FontAwesomeIcons.bell,color: Colors.orange[900]),
              ),
            )
          ],

      ),


      body: const SingleChildScrollView(

      ),
    );
  }
}
