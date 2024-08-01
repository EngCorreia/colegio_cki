
import '../../domain/entities/primeira_class_entity.dart';

class PrimeiraClassDisciplinaModel extends PrimeiraClassDisciplinaEntity{

  const PrimeiraClassDisciplinaModel({
    required super.nome,
    required super.documentId
  });


  factory PrimeiraClassDisciplinaModel.fromJson(String id,{required Map<String,dynamic> json}){
    return PrimeiraClassDisciplinaModel(
      nome: json["nome"],
      documentId: id
    );
  }

}