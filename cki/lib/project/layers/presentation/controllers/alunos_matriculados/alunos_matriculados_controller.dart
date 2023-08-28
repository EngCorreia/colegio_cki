
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

import '../../../core/const_strings/const_strings.dart';
import '../../../domain/entities/student_entity/student_data_entity.dart';
part 'alunos_matriculados_controller.g.dart';



class AlunosMatriculado = _AlunosMatriculado with _$AlunosMatriculado;
abstract class _AlunosMatriculado with Store{

  @observable
  StudentDataEntity? studentDataEntity;

  @observable
  ObservableList<StudentDataEntity> studenteList = ObservableList<StudentDataEntity>();


  Future<void> listaAlunosMatriculados({required String classe}) async{
   try{
     var readStudentResult = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
     collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).collection(Collections.collectionStudentRegister)
         .doc(Collections.collectionMatricula).collection(classe).snapshots();
     readStudentResult.listen((resultSet) {
       studenteList.clear();
       for(var student in resultSet.docs){
        // Map<String,dynamic>? listToJson = resultSet.data();
         if(student.exists){
             studentDataEntity = StudentDataEntity(
               studentName:  student["nome_aluno"],
               date: student["data_nascimento"],
               numberRG: student["registro_certidao"],
               address:  student["endereco"],
               motherName: student["nome_mae"],
               spaceJobMother: student["mae_trabalho"],
               emailMother: student["mae_email"],
               phoneNumberMother: student["mae_telefone"],
               fatherName: student["nome_pai"],
               spaceJobFather: student["pai_trabalho"],
               emailFather: student["pai_email"],
               phoneNumberFather: student["pai_telefone"],
               responseName: student["nome_responsavel"],
               responseObs: student["obs"],
               planoDeSaude: student["plano_de_saude"],
               problemaCronicoDeSaude: student["problema_cronico"],
               alergia: student["alergia"],
               diagnosticoMedicoDificiencia: student["dificiencia"],
               dificuldadeMotora: student["dificuldade_motora"],
               tratamento: student["tratamento_medico"],
               medicacao: student["medicacao"],
               vacinas: student["calendario_vacina_actualizado"],
               aconpanhamento: student["acompanhado_por_psicologo"],
               numeroDeEmergencia: student["numero_de_emergencia"],
               outraInformacaoDeSaude: student["outras_info_aluno"],
               primeiroNomeComplementares: student["nome1_pessoa_autorizada"],
               primeiroTelefoneComplementares: student["telefone1_pessoa_autorizada"],
               segundoNomeComplementares: student["nome2_pessoa_autorizada"],
               segundoTelefoneComplementares: student["telefone2_pessoa_autorizada"],
               terceiroNomeComplementares: student["nome3_pessoa_autorizada"],
               terceiroTelefoneComplementares: student["telefone3_pessoa_autorizada"],
               grupoNumero: student["grupo_numero"],

             );
             studenteList.add(studentDataEntity!);
           }
       }
     });
   }catch(e){


   }
  }
/*"classe": {"classeName": studentDataEntity.classeId,
    "periodo": studentDataEntity.periodo,
    },
    "numeroProcesso" : number
    */

}