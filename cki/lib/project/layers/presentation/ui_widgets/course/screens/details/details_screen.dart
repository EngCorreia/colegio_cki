import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../domain/entities/courses_entity/coures_entitiy.dart';
import '../../constants.dart';
import 'components/body.dart';

class DetailsCourses extends StatelessWidget {
  final  Course coures;
  const DetailsCourses({Key? key, required this.coures}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(context),
      body: BodyDetailCourse(coures: coures,),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        padding: const EdgeInsets.only(left: kDefaultPadding),
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: false,
      title: Text('Back'.toUpperCase(),
        style: Theme.of(context).textTheme.bodyText2,
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset('assets/icons/cart_with_item.svg'),
          onPressed: () {},
        ),
      ],
    );
  }
}
