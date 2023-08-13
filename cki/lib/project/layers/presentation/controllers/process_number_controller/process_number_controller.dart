

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProcessNumberController{

  int number = 0;
  Future<int> readNumberOfProcess() async{
    var readProcess = FirebaseFirestore.instance.collection("colegios").doc("kalabo_internacional")
        .collection("2023_a_2024").doc("cki_2023").collection("numero_processo").doc("numero_de_processo").snapshots();
    readProcess.listen((dataResult) {
      if(dataResult.exists){
        Map<String,dynamic>? process = dataResult.data();
        number = process!["numero"];
      }
    });
    return number;
  }


  Future<void> updateNumber(int number) async{
    var readProcess = FirebaseFirestore.instance.collection("colegios").doc("kalabo_internacional")
        .collection("2023_a_2024").doc("cki_2023").collection("numero_processo").doc("numero_de_processo").snapshots();
    readProcess.listen((dataResult) {
      if(dataResult.exists){
        Map<String,dynamic>? process = dataResult.data();
        number = process!["numero"];
      }
    });
  }
}