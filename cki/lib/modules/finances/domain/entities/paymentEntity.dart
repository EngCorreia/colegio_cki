import 'package:cki/modules/finances/domain/entities/monthlyEntity.dart';
import 'package:cki/modules/finances/domain/entities/uniforme_entity.dart';
import 'package:equatable/equatable.dart';
import 'atl_entity.dart';
import 'books_entity.dart';
import 'inscription_entity.dart';

class PaymentEntity extends Equatable{
  final String documentId;
  final String name;
  final String classe;
  final int status;
  final List<MonthlyEntity> monthlyList;
  final List<AtlEntity> atlList;
  final List<UniformEntity> uniformList;
  final List<BooksEntity> booksList;
  final List<InscriptionEntity> inscriptionList;
  final String uuid;

  const PaymentEntity({
    required this.documentId,
    required this.name,
    required this.classe,
    required this.status,
    required this.monthlyList,
    required this.atlList,
    required this.uniformList,
    required this.inscriptionList,
    required this.booksList,
    required this.uuid});

  @override
  List<Object?> get props => [
    documentId,
    name,
    classe,
    status,
    uuid,
    monthlyList,
    atlList,
    uniformList,
    booksList,
    inscriptionList
  ];
}