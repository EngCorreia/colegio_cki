
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../infra/locator.dart';
import '../../project/layers/core/configuration/configuration.dart';
import '../../project/layers/core/init_injection_dependence/init_dependence_injection.dart';
import '../../project/layers/presentation/ui_widgets/index_menu/index_view_page.dart';

Future<void> main() async {
  InitStateInjectionDependence();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load(fileName: "assets/env/prd/colegio.kalabo.prd.env").then((value) {
    setupLocator(dotenv.env['BASE_URL'], enviroment: dotenv.env['ENV']);
  });
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key, });
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '${dotenv.env['TITLLE_APP']}',
      theme: ThemeData(
          primaryColor: Colors.white,
          primaryIconTheme: const IconThemeData(color: Colors.black54),
          primaryTextTheme: TextTheme(titleLarge: TextStyle(color: Colors.black54, fontFamily: SettingsCki.segoeEui)),
          textTheme: TextTheme(titleLarge: TextStyle(color: Colors.black54,fontFamily: SettingsCki.segoeEui)),
          primarySwatch: Colors.amber,
          //colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange).copyWith(background: Colors.white)
      ),
      home: const IndexViewPage(),
    );
  }
}