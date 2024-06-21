
import '../../domain/entities/disciplina_class_entity.dart';
import '../../domain/entities/primeira_class_entity.dart';

class DisciplinaModel extends DisciplinaEntity{
  const DisciplinaModel({
    required super.nome
  });


  factory DisciplinaModel.fromJson({required Map<String,dynamic> json}){
    return DisciplinaModel(
      nome: json["nome"]
    );
  }

}