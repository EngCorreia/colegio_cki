

import '../../domain/entities/paymentEntity.dart';

class PaymentModels extends PaymentEntity{
  const PaymentModels({
    required super.name,
    required super.classe,
    required super.status,
    required super.paymentList,
    required super.uuid});
}