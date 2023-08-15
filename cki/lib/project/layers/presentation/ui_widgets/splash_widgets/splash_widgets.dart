
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

import '../../../core/configuration/configuration.dart';
import '../index_menu/index_page.dart';
import '../login_ui/login_ui.dart';
import '../login_ui/registerscreen.dart';


class SplashWidgets extends StatefulWidget {
  const SplashWidgets({Key? key}) : super(key: key);

  @override
  State<SplashWidgets> createState() => _SplashWidgetsState();
}

class _SplashWidgetsState extends State<SplashWidgets> {
 // var controller = PageController();
  final controller = PageController(keepPage: true);
  bool isLastPage = false;


  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 50),
        child: PageView(
          controller: controller,
          onPageChanged: (index){
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: [
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                    height: 350,
                    child: Image.asset("assets/images/colegio.png",fit: BoxFit.fill),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.blue,
                    height: MediaQuery.of(context).size.height/2.5,

                  ),
                )
              ],
            ),


            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 350,
                  child: Image.asset("assets/images/ckiLogo.png",fit: BoxFit.fill),
                ),
              ],
            ),

            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 350,
                  child: Image.asset("assets/images/matri.png",fit: BoxFit.fill),
                ),
              ],
            ),
          ],
        ),
      ),

      bottomSheet: isLastPage ? Container(
        height: 50,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            minimumSize: const Size.fromHeight(800),
            backgroundColor: Colors.orange
          ),
            onPressed: () async {
              final pref = await SharedPreferences.getInstance();
              pref.setBool("showHome", true);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegisterScreen()));
            },
            child: Text("COMEÇAR",style: TextStyle(
              fontFamily: SettingsCki.segoeEui,
              color: Colors.white,
              fontSize: 18
            ),),
        ),
      ) : Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            TextButton(onPressed: (){
              controller.jumpToPage(0);
            }, child: Text("SALTAR",style: TextStyle(
                fontFamily: SettingsCki.segoeEui
            ),),),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count:3,
                effect: WormEffect(
                  spacing: 16,
                  dotColor: Colors.blue,
                  activeDotColor: Colors.red.shade700,
                ),
                onDotClicked: (index) => controller.animateToPage(index,
                    duration: const Duration(
                      milliseconds: 500
                    ),
                    curve: Curves.easeIn),
              ),
            ),

            TextButton(onPressed: (){
              controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
            }, child: Text("AVANÇAR",style: TextStyle(
                fontFamily: SettingsCki.segoeEui
            ),),),

          ],
        ),
      ),
    );
  }
}
