

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import '../../presentation/controllers/read_course_controller/read_course_controller.dart';
import 'listener.dart';

class ListenerFirebaseImp implements ListenerFirebase{
  final controller = GetIt.instance.get<ReadCourseController>();

  @override
  Future<void> listenerCourse() async{
    var readCourseResult = FirebaseFirestore.instance.collection("colegios").doc("kalabo_internacional")
        .collection("2023_a_2024").doc("cki_2023").collection("cursos").orderBy("id").snapshots();
    readCourseResult.listen((event) {
      controller.readCourse();
    });
  }

}