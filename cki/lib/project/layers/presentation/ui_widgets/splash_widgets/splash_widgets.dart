
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

import '../../../core/configuration/configuration.dart';
import '../index_menu/home_page.dart';

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
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                    height: 350,
                    child: Image.asset("assets/images/colegio.png",fit: BoxFit.fill),
                ),
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
            backgroundColor: Colors.teal.shade700
          ),
            onPressed: () async {
              final pref = await SharedPreferences.getInstance();
              pref.setBool("showHome", true);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> IndexPage()));
            },
            child: Text("COMEÇAR",style: TextStyle(
              color: Colors.white,
              fontFamily: SettingsCki.segoeEui
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
            }, child: Text("SALTAR"),),
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
            }, child: Text("COMEÇAR"),),

          ],
        ),
      ),
    );
  }
}
