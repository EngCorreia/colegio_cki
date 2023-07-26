

import 'package:cki/project/layers/domain/entities/courses_entity/coures_entitiy.dart';
import 'package:cki/project/layers/domain/usecases/read_course_usecase/read_course_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../repositories/read_course_repository/read_course_repository.dart';

class ReadCourseUseCaseImp implements ReadCourseUseCase{
  final ReadCourseRepository _readCourseRepository;
  ReadCourseUseCaseImp(this._readCourseRepository);

  @override
  Future<Either<Exception, List<Course>>> call() async => _readCourseRepository();

}