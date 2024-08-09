import '../../domain/entities/monthlyEntity.dart';

class MonthlyModel extends MonthlyEntity{
  const MonthlyModel({
    required super.status,
    required super.data,
    required super.mes,
  required super.valor});

  static List<MonthlyModel> formJson({required List<dynamic> json}){
    List<MonthlyModel> lists = [];
    for(var res in json){
      lists.add( MonthlyModel(
          mes: res["mes"],
          status: res["status"],
          data: res["data"].toString(),
          valor: res["valor"],
      ));
    }
    return lists;
  }

}