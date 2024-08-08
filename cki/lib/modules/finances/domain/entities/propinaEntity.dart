import 'package:equatable/equatable.dart';

class PropinaEntity extends Equatable{
  final int status;
  final String data;
  final String mes;

  PropinaEntity({required this.status, required this.data, required this.mes});

  @override
  // TODO: implement props
  List<Object?> get props => [
    status,
    data,
    mes
  ];


}