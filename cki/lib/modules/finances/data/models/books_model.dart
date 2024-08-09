import '../../domain/entities/books_entity.dart';

class BooksModel extends BooksEntity{
  const BooksModel({
    required super.status,
    required super.data,
    required super.mes,
    required super.valor});

  static List<BooksModel> formJson({required List<dynamic> json}){
    List<BooksModel> lists = [];
    for(var res in json){
      lists.add(BooksModel(
          mes: res["mes"],
          status: res["status"],
          data: res["data"].toString(),
          valor: res["valor"],
      ));
    }
    return lists;
  }

}