import 'package:cki/project/layers/data/datasource/fire_base/save_new_student_datasource/save_new_student_datasource.dart';
import 'package:cki/project/layers/domain/entities/student_entity/student_data_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/const_strings/const_strings.dart';
import '../../../../core/const_strings/user_information.dart';
import '../../../../core/errors/save_student_error.dart';
import '../../../dto/new_student_dto/new_student_dto.dart';

class SaveNewStudentDataSourceImp implements SaveNewStudentDataSource {
  bool isSaved = false;
  var studentId;

  @override
  Future<Either<SaveStudentError, bool>> call({required StudentDataEntity studentDataEntity,required int number,required String classe}) async{

    try{
      bool readed = false;
      var saveStudentResult = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
      collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).collection(Collections.collectionStudentRegister)
          .doc(Collections.collectionMatricula).collection(classe).doc();
      var result = StudentDto.fromJson(studentDataEntity,number,classe);
      studentId = saveStudentResult.id;
      if(result.isNotEmpty){
        saveStudentResult.set(result).whenComplete(() async{
          var saveStudentResult = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
          collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).collection("cki-financas")
              .doc(studentId).snapshots();
          saveStudentResult.listen((event) {
            if(event.exists){
              if(readed == false){
                readed = true;
              }
            }else{
              var gravaFinancas = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
              collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).collection("cki-financas")
                  .doc(studentId);
              Map<String,dynamic> financas = {
                "uuid": StudentInformation.userID,
                "nome": result["nome_aluno"],
                "classe": classe,
                "atl":[{
                  "status": 0,
                  "data": Timestamp.now(),
                  "valor": 1,
                  "mes": Timestamp.now().toDate().month,
                }],
                "inscricao":[{
                  "status": 0,
                  "data": Timestamp.now(),
                  "valor": 0,
                  "mes": Timestamp.now().toDate().month,
                }],

                "propina":[{
                  "status": 0,
                  "data": Timestamp.now(),
                  "valor": 0,
                  "mes": Timestamp.now().toDate().month,
                }],

                "livro":[{
                  "status": 1,
                  "data": Timestamp.now(),
                  "valor": 0,
                  "mes": Timestamp.now().toDate().month,
                }],

                "uniforme":[{
                  "status": 0,
                  "data": Timestamp.now(),
                  "valor": 0,
                  "mes": Timestamp.now().toDate().month,
                }],
                "status": 0
              };

              gravaFinancas.set(financas);
              readed = true;
            }
          });

        });
        isSaved = true;
        return Right(isSaved);
      }else{
        return Left(SaveStudentError("error ao salvar novo aluno"));
      }

    }catch(e){
      return Left(SaveStudentError(e.toString()));
    }
  }

}