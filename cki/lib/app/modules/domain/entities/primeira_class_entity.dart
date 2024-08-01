
import 'package:equatable/equatable.dart';

class PrimeiraClassDisciplinaEntity extends Equatable{
  final String nome;
  final String documentId;

  const PrimeiraClassDisciplinaEntity({
  required this.nome,
    required this.documentId,
  });

  @override
  List<Object?> get props => [
    documentId,
    nome
  ];

}