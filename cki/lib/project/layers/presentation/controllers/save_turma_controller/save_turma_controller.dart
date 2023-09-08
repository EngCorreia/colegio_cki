

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/const_strings/const_strings.dart';
import '../../../core/show_toast_message/show_toast_message.dart';
import '../../../domain/entities/turmas_entity/turmas_entity.dart';

class SaveTurma{


  Future<bool> salvar({required TurmaEntity turmaEntity}) async{

    bool saved = false;
    try{
      var saveTurma = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
      collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).collection(Collections.collectionTurmas).doc();
      Map<String,dynamic> turma = {
        "classe" : turmaEntity.classe,
        "nome" : turmaEntity.nome,
        "periodo" : turmaEntity.periodo,
        "sala" : turmaEntity.sala,
      };
      saveTurma.set(turma).whenComplete((){
        saved = true;
      });

      return saved;

    }catch(e){
    return saved;
    }




  }

}