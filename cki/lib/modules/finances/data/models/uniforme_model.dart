import '../../domain/entities/uniforme_entity.dart';

class UniformModel extends UniformEntity{
  const UniformModel({
    required super.status,
    required super.data,
    required super.mes,
    required super.valor});

  static List<UniformModel> formJson({required List<dynamic> json}){
    List<UniformModel> lists = [];
    for(var res in json){
      lists.add(UniformModel(
          mes: res["mes"],
          status: res["status"],
          data: res["data"].toString(),
          valor: res["valor"],
      ));
    }
    return lists;
  }

}