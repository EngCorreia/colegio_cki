import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../mobx_ui/menu_index.dart';
import '../home_page/menu_widgets.dart';
import '../matricula/matriculas.dart';


class IndexPage extends StatefulWidget {

  IndexPage({Key ? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  late List<Widget> firstFlowPagesList = [];

  final favoritePosts = BusinessFavoritePostControl();

  @override
  void initState() {
    super.initState();
    firstFlowPagesList.clear();
    firstFlowPagesList
      ..add(MenuWidgets())
      ..add(const Matricula())
      ..add(const Matricula())
      ..add(const Matricula());
  }

  @override
  Widget build(context) {
    // integration.getNetLogiaIntegration();
    return Scaffold(
      body: Observer(
        builder: (context)=> firstFlowPagesList[favoritePosts.selectedIndex!],
      ),
      bottomNavigationBar: Observer(
        builder: (_)=>BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home,),
                //icon: Icon(FontAwesomeIcons.pray),
                label: "Menu"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Aluno"
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.supervisor_account,),
                label: "Informações"
            ),


            BottomNavigationBarItem(
                icon: Icon(Icons.addchart_rounded,),
                label: "Avaliação"
            ),


          ],
          currentIndex: favoritePosts.selectedIndex!,
          fixedColor: const Color(0xFF364195),
          onTap: favoritePosts.setSelectedIndex,
        ),
      ),
    );
  }
}
