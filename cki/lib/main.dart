

import 'package:cki/project/layers/core/configuration/configuration.dart';
import 'package:cki/project/layers/presentation/ui_widgets/index_menu/index_page.dart';
import 'package:cki/project/layers/presentation/ui_widgets/splash_widgets/splash_widgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  final showHome = pref.getBool('showHome') ?? false;
  runApp(MyApp(showHome: showHome,));
}

class MyApp extends StatelessWidget {

  final bool? showHome;
  const MyApp({super.key, this.showHome});


  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Colegio CKI',
    theme: ThemeData(
        primaryColor: Colors.white,
        backgroundColor: Colors.white,
        primarySwatch: Colors.orange,
        primaryIconTheme: const IconThemeData(color: Colors.black54),
        primaryTextTheme: TextTheme(subtitle1: TextStyle(color: Colors.black54, fontFamily: SettingsCki.segoeEui)),
        textTheme: TextTheme(subtitle1: TextStyle(color: Colors.black54,fontFamily: SettingsCki.segoeEui))
    ),
        home: showHome! ? IndexPage() : const SplashWidgets(),
      //const OnBoardingPage()
      );
}
