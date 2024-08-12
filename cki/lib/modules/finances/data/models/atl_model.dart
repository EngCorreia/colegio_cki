import '../../domain/entities/atl_entity.dart';

class AtlModel extends AtlEntity{
  AtlModel({
    required super.status,
    required super.data,
    required super.mes,
  required super.valor});

  static List<AtlModel> formJson({required List<dynamic> json}){
    List<AtlModel> lists = [];
    for(var res in json){
      lists.add( AtlModel(
          mes: res["mes"],
          status: res["status"],
          data: res["data"],
          valor: res["valor"],
      ));
    }
    return lists;
  }

}