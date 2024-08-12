
import 'package:equatable/equatable.dart';

class AtlEntity extends Equatable{
  final int status;
  var data;
  final String mes;
  final int valor;
  AtlEntity({required this.status, this.data, required this.mes, required this.valor});
  @override
  List<Object?> get props => [
    status,
    data,
    mes,
    valor
  ];
}