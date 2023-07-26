import 'dart:developer';
import '../../../core/show_toast_message/show_toast_message.dart';
import '../../../domain/entities/student_entity/student_data_entity.dart';
import '../../../domain/usecases/create_new_student_usecase/create_new_student_usecase.dart';

class SaveNewStudentController{

  final CreateNewStudentUseCase _createNewStudentUseCase;
  SaveNewStudentController(this._createNewStudentUseCase);

  Future<void> saveStudent({required StudentDataEntity studentDataEntity}) async{
    var result = await _createNewStudentUseCase(studentDataEntity: studentDataEntity);
    result.fold((error) => log("**** ${error.message}"),
            (success){
      ShowToast.show_message_Success("Inscrição feita com sucesso ...");
    });
  }
}