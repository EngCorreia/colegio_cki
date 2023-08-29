

import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../core/show_toast_message/show_toast_message.dart';
import '../../../domain/entities/courses_entity/coures_entitiy.dart';
import '../../../domain/usecases/read_course_usecase/read_course_usecase.dart';
part 'read_course_controller.g.dart';

class ReadCourseController = _ReadCourseController with _$ReadCourseController;
abstract class _ReadCourseController with Store{

  final ReadCourseUseCase _readCourseUseCase;
  _ReadCourseController(this._readCourseUseCase);

  @observable
  ObservableList<Course> courseList = ObservableList();
  @observable
  String? status = "";

  Future<void> readCourse() async {
    var result = await _readCourseUseCase();
    result.fold((error) {
      status = error.toString();
      log("**** error controller ${error}");
    },
            (success){
              courseList = success.asObservable();
              status = "done";
        });
  }
}