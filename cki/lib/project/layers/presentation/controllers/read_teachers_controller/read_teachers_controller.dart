


 import 'dart:developer';

import '../../../core/show_toast_message/show_toast_message.dart';
import '../../../domain/entities/teachers_entity/teachers_entity.dart';
import '../../../domain/usecases/read_teacher_list_usecase/read_teacher_list_usecase.dart';

class ReadTeachersController {

  final ReadTeachersUseCase _readTeachersUseCase;
  ReadTeachersController(this._readTeachersUseCase);

  List<TeachersEntity> teacherList = [];

  Future<void> readCourse() async {
    var result = await _readTeachersUseCase();
    result.fold((error) => log("**** error controller ${error}"),
            (listTeachers){
              teacherList = listTeachers;
          ShowToast.show_message_Success("Inscrição feita com sucesso...");
        });
  }
}