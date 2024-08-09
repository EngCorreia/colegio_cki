
import 'package:cki/modules/finances/data/models/uniforme_model.dart';
import '../../domain/entities/paymentEntity.dart';
import 'atl_model.dart';
import 'books_model.dart';
import 'inscription_model.dart';
import 'monthlyModels.dart';

class PaymentModels extends PaymentEntity{
  const PaymentModels({
    required super.documentId,
    required super.name,
    required super.classe,
    required super.status,
    required super.paymentList,
    required super.atlList,
    required super.uniformList,
    required super.inscriptionList,
    required super.booksList,
    required super.uuid});

  factory PaymentModels.fromJson({required Map<String,dynamic> json,required String id}){
    return PaymentModels(
      documentId: id,
      classe: json["classe"],
      name: json["nome"],
      status: json["status"],
      uuid: json["uuid"],
      paymentList: MonthlyModel.formJson(json: json["propinas"]),
      atlList: AtlModel.formJson(json: json["atl"]),
      uniformList: UniformModel.formJson(json: json["uniforme"]),
      booksList: BooksModel.formJson(json: json["livro"]),
      inscriptionList: InscriptionModel.formJson(json: json["inscricao"]),
    );
  }
}