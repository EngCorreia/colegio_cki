
import '../../domain/entities/tranport_entity.dart';

class TransportModel extends TransportEntity{
  const TransportModel({
    required super.status,
    required super.data,
    required super.mes,
    required super.valor});

  static List<TransportModel> formJson({required List<dynamic> json}){
    List<TransportModel> lists = [];
    for(var res in json){
      lists.add(TransportModel(
        mes: res["mes"],
        status: res["status"],
        data: res["data"].toString(),
        valor: res["valor"],
      ));
    }
    return lists;
  }

}