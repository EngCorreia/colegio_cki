import 'package:cki/project/layers/core/configuration/configuration.dart';
import 'package:cki/project/layers/presentation/ui_widgets/equipe_details/profi.dart';
import 'package:cki/project/layers/presentation/ui_widgets/equipe_details/user.dart';
import 'package:cki/project/layers/presentation/ui_widgets/equipe_details/userPref.dart';
import 'package:flutter/material.dart';

import 'numberWidgets.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      //appBar: buildAppBar(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 20,),
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(user),
         // const SizedBox(height: 24),
         // Center(child: buildUpgradeButton()),
          const SizedBox(height: 24),
          NumbersWidget(),
          const SizedBox(height: 30),
          buildAbout(user),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
    children: [
      Text(
        user.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,fontFamily: SettingsCki.segoeEui),
      ),
      const SizedBox(height: 4),
      Text(
        user.email,
        style: TextStyle(color: Colors.grey,fontFamily: SettingsCki.segoeEui),
      )
    ],
  );


  Widget buildAbout(User user) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text('Formação academica',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,fontFamily: SettingsCki.segoeEui),
        ),
        const SizedBox(height: 16),

        Container(
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
            children: [
              const SizedBox(
                height: 6,
              ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(user.about,
              style: TextStyle(fontSize: 16, height: 1.4,fontFamily: SettingsCki.segoeEui),
            ),
          ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        Text('Experiencia de trabalho',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,fontFamily: SettingsCki.segoeEui),
        ),
        const SizedBox(height: 16),

        Container(
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
            children: [
              const SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(user.about,
                  style: TextStyle(fontSize: 16, height: 1.4,fontFamily: SettingsCki.segoeEui),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        Text('Certificações academica',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,fontFamily: SettingsCki.segoeEui),
        ),
        const SizedBox(height: 16),

        Container(
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
            children: [
              const SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(user.about,
                  style: TextStyle(fontSize: 16, height: 1.4,fontFamily: SettingsCki.segoeEui),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),

        const SizedBox(
          height: 30,
        ),
      ],
    ),
  );
}