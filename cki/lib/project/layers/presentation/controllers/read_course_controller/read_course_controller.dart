

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

  Future<void> readCourse() async {
    var result = await _readCourseUseCase();
    result.fold((error) => log("**** error controller ${error}"),
            (success){
              courseList = success.asObservable();
              ShowToast.show_message_Success("Inscrição feita com sucesso... ${courseList[0].prices}");
        });
  }
}