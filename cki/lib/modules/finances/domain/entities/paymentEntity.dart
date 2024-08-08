

import 'package:cki/modules/finances/domain/entities/propinaEntity.dart';
import 'package:equatable/equatable.dart';

class PaymentEntity extends Equatable{
  final String name;
  final String classe;
  final int status;
  final List<PropinaEntity> paymentList;
  final String uuid;

  const PaymentEntity({required this.name,
    required this.classe,
    required this.status,
    required this.paymentList,
    required this.uuid});

  @override
  List<Object?> get props => [
    name,
    classe,
    status,
    uuid,
    paymentList
  ];
}