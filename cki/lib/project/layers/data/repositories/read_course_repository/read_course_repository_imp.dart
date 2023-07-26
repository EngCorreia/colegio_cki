
import 'package:cki/project/layers/domain/entities/courses_entity/coures_entitiy.dart';

import 'package:dartz/dartz.dart';

import '../../../domain/repositories/read_course_repository/read_course_repository.dart';
import '../../datasource/fire_base/read_course_datasource/read_course_datasource.dart';

class ReadCourseRepositoryImp implements ReadCourseRepository{

  final ReadCourseDataSource _readCourseDataSource;
  ReadCourseRepositoryImp(this._readCourseDataSource);

  @override
  Future<Either<Exception, List<Course>>> call() async => _readCourseDataSource();

}