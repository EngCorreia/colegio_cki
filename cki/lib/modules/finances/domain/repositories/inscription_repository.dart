

import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';

abstract class InscriptionRepository {
  Future<Either<Failure,bool>> getInscriptions();
}