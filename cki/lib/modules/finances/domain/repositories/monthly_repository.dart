import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';

abstract class MonthlyRepository {
  Future<Either<Failure,bool>> getMonthly();
}