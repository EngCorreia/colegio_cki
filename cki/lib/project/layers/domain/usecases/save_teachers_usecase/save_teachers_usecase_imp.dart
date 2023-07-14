

import 'package:cki/project/layers/domain/usecases/save_teachers_usecase/save_teachers_usecase.dart';

import 'package:dartz/dartz.dart';

import '../../../presentation/ui_widgets/teachers/teachers.dart';

class SaveTeachersUseCaseImp implements SaveTeachersUseCase{

  @override
  Future<Either<Exception, bool>> call({required Teachers teachers}) {
    // TODO: implement call
    throw UnimplementedError();
  }

}