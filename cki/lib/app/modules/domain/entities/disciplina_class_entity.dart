
import 'package:equatable/equatable.dart';

class DisciplinaEntity extends Equatable{
  final String nome;

  const DisciplinaEntity({

  required this.nome});

  @override
  List<Object?> get props => [

    nome
  ];

}