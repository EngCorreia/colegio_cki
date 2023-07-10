

import 'package:dartz/dartz.dart';

import '../../../presentation/ui_widgets/contacts/teachers/teachers.dart';

abstract class SaveTeachersUseCase{
  Future<Either<Exception,bool>> call({required Teachers teachers});
}