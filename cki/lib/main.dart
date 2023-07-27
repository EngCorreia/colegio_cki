

import 'package:cki/project/layers/core/configuration/configuration.dart';
import 'package:cki/project/layers/core/init_injection_dependence/init_dependence_injection.dart';
import 'package:cki/project/layers/presentation/ui_widgets/course/screens/product/products_screen.dart';
import 'package:cki/project/layers/presentation/ui_widgets/login_ui/login_ui.dart';
import 'package:cki/project/layers/presentation/ui_widgets/splash_widgets/splash_widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> main() async {
  InitStateInjectionDependence();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AwesomeNotifications().initialize(
    // set the icon to null if you want to use the default app icon
      'resource://drawable/res_app_icon',
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white)
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
            channelGroupKey: 'basic_channel_group',
            channelGroupName: 'Basic group')
      ],
      debug: true
  );
  ReceivedAction? receivedAction = await AwesomeNotifications().getInitialNotificationAction(
      removeFromActionEvents: false
  );
  if(receivedAction?.channelKey == 'call_channel') {
    ProductsScreen();
  } else {
    ProductsScreen();
  }
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
        home: showHome! ? const Login() : const SplashWidgets(),
      //const OnBoardingPage()
      );
}
