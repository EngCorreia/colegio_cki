
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';

import '../../../core/configuration/configuration.dart';
import '../area_financeira_aluno/area_financeira_aluno.dart';
import '../home_page/menu_widgets.dart';
import '../money_student/money_student.dart';
import '../notification_student/notification.dart';
import '../student_information/student_information.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _selectedIndex = 0;
  late List<Widget> firstFlowPagesList = [];

  @override
  void initState() {
    super.initState();
    firstFlowPagesList.clear();
    firstFlowPagesList
      ..add(MenuWidgets())
      ..add(const StudentInformationUi())
      ..add(const FinancasAluno())
      ..add(const NotificationUi());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: firstFlowPagesList.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.orange[900],
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black54,
              tabs: [

                GButton(
                  icon: Icons.home_rounded,
                  text: 'Colegio',
                  iconSize: 20,
                  textStyle: TextStyle(
                    fontFamily: SettingsCki.segoeEui,
                    color: Colors.orange[900]
                  ),
                ),

                GButton(
                  icon: FontAwesomeIcons.graduationCap,
                  text: 'Aluno',
                  iconSize: 20,
                  textStyle: TextStyle(
                      fontFamily: SettingsCki.segoeEui,
                      color: Colors.orange[900]
                  ),
                ),

                GButton(
                  icon: FontAwesomeIcons.moneyBillAlt,
                  text: 'Finança',
                  iconSize: 20,
                  textStyle: TextStyle(
                      fontFamily: SettingsCki.segoeEui,
                      color: Colors.orange[900]
                  ),
                ),
                GButton(
                  icon: FontAwesomeIcons.bell,
                  iconSize: 20,
                  text: 'Alertas',
                  textStyle: TextStyle(
                      fontFamily: SettingsCki.segoeEui,
                      color: Colors.orange[900]
                  ),
                ),

              ],

              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },

            ),
          ),
        ),
      ),
    );
  }
}