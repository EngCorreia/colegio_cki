
import 'package:equatable/equatable.dart';

class TeacherClassListEntity extends Equatable{
  final String classe;
  final String id;
  final String name;
  final String periodo;
  final int sala;

  const TeacherClassListEntity({
    required this.classe,
    required this.id,
    required this.name,
     required this.periodo,
  required this.sala});

  @override
  List<Object?> get props => [
    classe,
    id,
    name,
    sala,
    periodo
  ];

}