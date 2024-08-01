

import '../../domain/entities/teacher_class_list_entity.dart';

class TeacherClassListModel extends TeacherClassListEntity{

  const TeacherClassListModel({
    required super.classe,
    required super.id,
    required super.name,
    required super.periodo,
    required super.sala});

  factory TeacherClassListModel.fromJason(Map<String,dynamic> json)=>
      TeacherClassListModel(
        classe: json["classe"],
        id: json["id"],
        name: json["nome"],
        periodo: json["periodo"],
        sala: json["sala"],
      );
}