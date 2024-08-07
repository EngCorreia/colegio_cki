
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:asuka/asuka.dart'  as asuka;
import '../../../../../core/snackBar/snackBar.dart';
import '../../../core/configuration/configuration.dart';
import '../../../core/local_notification_service/local_notification_service.dart';
import '../area_financeira_aluno/area_financeira_aluno.dart';
import '../home_page/menu_widgets.dart';
import '../login_ui/registerscreen.dart';
import '../student_information/student_information.dart';
import 'index_view_model_page.dart';

class IndexViewPage extends StatefulWidget {
  const IndexViewPage({super.key});
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexViewPage> {
  int _selectedIndex = 0;
  late List<Widget> firstFlowPagesList = [];
  late NotificationService local= NotificationService();
  String get home => dotenv.env['HOME']!;
  String get information => dotenv.env['INFOR']!;
  String get money => dotenv.env['MONEY']!;
  String get user => dotenv.env['STUDENT']!;

  @override
  void initState() {
    super.initState();
    local.checkForNotifications();
    firstFlowPagesList.clear();
    firstFlowPagesList
      ..add(const MenuWidgets())
      ..add(const StudentInformationUi())
      ..add(const FinancasAluno())
    ..add(const RegisterScreen());

  }


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IndexViewModelPage>.reactive(
        viewModelBuilder: ()=> IndexViewModelPage(),
        builder: (context,model,child)=>
            Scaffold(
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
                          text: home,
                          iconSize: 20,
                          textStyle: TextStyle(
                              fontFamily: SettingsCki.segoeEui,
                              color: Colors.orange[900]
                          ),
                        ),

                        GButton(
                          icon: FontAwesomeIcons.graduationCap,
                          text: information,
                          iconSize: 20,
                          textStyle: TextStyle(
                              fontFamily: SettingsCki.segoeEui,
                              color: Colors.orange[900]
                          ),
                        ),

                        GButton(
                          icon: FontAwesomeIcons.moneyBillAlt,
                          text: money,
                          iconSize: 20,
                          textStyle: TextStyle(
                              fontFamily: SettingsCki.segoeEui,
                              color: Colors.orange[900]
                          ),
                        ),

                        /*
                GButton(
                  icon: FontAwesomeIcons.bell,
                  iconSize: 20,
                  text: 'Alertas',
                  textStyle: TextStyle(
                      fontFamily: SettingsCki.segoeEui,
                      color: Colors.orange[900]
                  ),
                ),

                */

                        GButton(
                          icon: FontAwesomeIcons.user,
                          iconSize: 20,
                          text: user,
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
                          if(index == 1){
                            asuka.AsukaSnackbar.success("Success").show();
                          }
                        });
                      },

                    ),
                  ),
                ),
              ),
            )
    );
  }
}