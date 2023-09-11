import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

import '../../../core/const_strings/const_strings.dart';
import '../../../core/show_toast_message/show_toast_message.dart';
import '../../../domain/entities/lista_turma_entity/lista_turma_entity.dart';
part 'listagem_de_turma_controller.g.dart';

class Listagem = _Listagem with _$Listagem;
abstract class _Listagem with Store{

  @observable
  TurmaEntity? turmaEntity;

  @observable
  ObservableList<TurmaEntity> turmaList = ObservableList();

  Future<void> leituraLista() async{
    try{
      var readStudentResult = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
      collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).collection("turmas").orderBy("sala").snapshots();
      readStudentResult.listen((resultSet) {
        turmaList.clear();
        for(var turma in resultSet.docs){
          if(turma.exists){
            turmaEntity = TurmaEntity(
              id: turma.id,
              classe: turma["classe"],
              nome: turma["nome"],
              periodo: turma["periodo"],
              sala: turma["sala"],
            );
            turmaList.add(turmaEntity!);
          }
        }
      });
    }catch(e){
      log(e.toString());
      ShowToast.show_error(e.toString());
    }
  }

}

