

import 'package:dartz/dartz.dart';

import '../../../presentation/ui_widgets/teachers/teachers.dart';


abstract class SaveTeachersUseCase{
  Future<Either<Exception,bool>> call({required Teachers teachers});
}