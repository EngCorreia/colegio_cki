import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../../../../../../core/listeners/listener.dart';
import '../../../../../../core/listeners/listenner_classe.dart';
import '../../../../../controllers/read_course_controller/read_course_controller.dart';
import '../../../../../controllers/save_new_student_controller/save_new_student_controller.dart';
import '../../../components/search_box.dart';
import '../../../constants.dart';
import 'category_list.dart';
import 'product_card.dart';



class BodyCourse extends StatefulWidget {
  const BodyCourse({super.key});
  @override
  State<BodyCourse> createState() => _BodyCourseState();
}

class _BodyCourseState extends State<BodyCourse> {

  final _controllerReadCourse = GetIt.I.get<ReadCourseController>();

  @override
  void initState() {
    super.initState();
    _controllerReadCourse.readCourse();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: <Widget>[
          SearchBox(onChanged: (value) {}),
          CategoryList(),
          const SizedBox(height: kDefaultPadding / 2),
          Expanded(
            child: Stack(
              children: <Widget>[
                // Our background
                Container(
                  margin: const EdgeInsets.only(top: 70),
                  decoration: const BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),


                Observer(
                  builder:(_)=> _controllerReadCourse.status != "" ? ListView.builder(
                    // here we use our demo procuts list
                    physics: const BouncingScrollPhysics(),
                    itemCount: _controllerReadCourse.courseList.length,
                    itemBuilder: (context, index) => CoursesCard(
                      itemIndex: index,
                      coures: _controllerReadCourse.courseList[index],
                    ),
                  ): const Center(
                    child: CupertinoActivityIndicator(
                      radius: 15,
                      color: Colors.black,
                    ),
                  ),
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}
