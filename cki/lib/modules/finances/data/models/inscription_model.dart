import '../../domain/entities/inscription_entity.dart';

class InscriptionModel extends InscriptionEntity{
  const InscriptionModel({
    required super.status,
    required super.data,
    required super.mes,
    required super.valor});
  static List<InscriptionModel> formJson({required List<dynamic> json}){
    List<InscriptionModel> lists = [];
    for(var res in json){
      lists.add(InscriptionModel(
          mes: res["mes"],
          status: res["status"],
          data: res["data"].toString(),
          valor: res["valor"],
      ));
    }
    return lists;
  }
}