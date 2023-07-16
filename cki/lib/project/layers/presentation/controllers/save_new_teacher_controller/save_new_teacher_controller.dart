import 'dart:developer';

import '../../../core/show_toast_message/show_toast_message.dart';
import '../../../domain/entities/teachers_entity/teachers_entity.dart';
import '../../../domain/usecases/create_new_teachers_usecase/create_new_teachers_usecase.dart';

class SaveNewTeacherController{

  final CreateNewTeachersUseCase _createNewTeachersUseCase;
  SaveNewTeacherController(this._createNewTeachersUseCase);

  Future<void> saveTeacher({required TeachersEntity teachersEntity}) async{
    var result = await _createNewTeachersUseCase(teachersEntity: teachersEntity);
    result.fold((error) => log("**** ${error.message}"),
            (success){
          ShowToast.show_message_Success("Professor gravado com sucesso ${success.toString()}");
        });
  }


}