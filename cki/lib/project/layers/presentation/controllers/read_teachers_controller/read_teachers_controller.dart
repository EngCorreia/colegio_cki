
import 'dart:developer';

import 'package:mobx/mobx.dart';
import '../../../domain/entities/teachers_entity/teachers_entity.dart';
import '../../../domain/usecases/read_teacher_list_usecase/read_teacher_list_usecase.dart';
part 'read_teachers_controller.g.dart';

class ReadTeachersController = _ReadTeachersController with _$ReadTeachersController;
abstract class _ReadTeachersController with Store {

  final ReadTeachersUseCase _readTeachersUseCase;
  _ReadTeachersController(this._readTeachersUseCase);

  @observable
  ObservableList<TeachersEntity> teacherList = ObservableList();

  Future<void> readAllTeachers() async {
    var result = await _readTeachersUseCase();
    result.fold((error) => log("**** error controller ${error}"),
            (listTeachers){
              teacherList = listTeachers.asObservable();
         // ShowToast.show_message_Success("Inscrição feita com sucesso...");
        });
  }
}