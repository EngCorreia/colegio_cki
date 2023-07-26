import 'package:cki/project/layers/core/configuration/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import '../../../../../core/listeners/listenner_classe.dart';
import '../../../../controllers/read_course_controller/read_course_controller.dart';
import '../../constants.dart';
import 'components/body.dart';

class ProductsScreen extends StatefulWidget {
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: kPrimaryColor,
      body: const BodyCourse(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      backgroundColor: kPrimaryColor,
      title: Text('Cursos e Classes',style: TextStyle(fontFamily: SettingsCki.segoeEui,color: Colors.white),),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/notification.svg"),
          onPressed: () {},
        ),
      ],
    );
  }
}
