import 'package:cki/project/layers/core/configuration/configuration.dart';
import 'package:cki/project/layers/core/init_injection_dependence/init_dependence_injection.dart';
import 'package:cki/project/layers/presentation/ui_widgets/index_menu/index_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


Future<void> main() async {
  InitStateInjectionDependence();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Colegio CKI',
      theme: ThemeData(
        primaryColor: Colors.white,
        primaryIconTheme: const IconThemeData(color: Colors.black54),
        primaryTextTheme: TextTheme(
            titleMedium: TextStyle(
                color: Colors.black54, fontFamily: SettingsCki.segoeEui)),
        textTheme: TextTheme(
            titleMedium: TextStyle(
                color: Colors.black54, fontFamily: SettingsCki.segoeEui)),
        primarySwatch: Colors.amber,
        //colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange).copyWith(background: Colors.white)
      ),
      home: const IndexPage(),
      //const OnBoardingPage()
    );
  }
}
