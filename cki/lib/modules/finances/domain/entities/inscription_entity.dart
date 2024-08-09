
import 'package:equatable/equatable.dart';

class InscriptionEntity extends Equatable{
  final int status;
  final String data;
  final String mes;
  final int valor;
  const InscriptionEntity({required this.status, required this.data, required this.mes, required this.valor});
  @override
  List<Object?> get props => [
    status,
    data,
    mes,
    valor
  ];
}