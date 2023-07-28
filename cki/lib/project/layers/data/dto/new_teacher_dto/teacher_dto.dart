



import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/teachers_entity/teachers_entity.dart';

class TeachersDto extends TeachersEntity{
  String? _name;
  String? _address;
  int? _phone;
  String? _level;
  String? _email;
  String? _classTeacher;
  String? _experience;
  List<String>? _listDeCadeira;

  TeachersDto({String? name,String? level,String? experience,String? email,String? address,int? phone,String? classTeacher,List<String>? listDeCadeira}) : super(
    name: name,
    classTeacher: classTeacher,
    level: level,
     listDeCadeira: listDeCadeira,
    address: address,
    email: email,
    experience: experience,
    phone: phone
  ){
    _name = name;
    _level = level;
    _classTeacher = classTeacher;
    _listDeCadeira = listDeCadeira;
    _email = email;
    _experience = experience;
    _phone = phone;
    _address = address;

  }

  String? get name => _name;

  set name(String? value) {
    _name = value;
  }

  String? get level => _level;

  List<String>? get listDeCadeira => _listDeCadeira;

  set listDeCadeira(List<String>? value) {
    _listDeCadeira = value;
  }

  String? get classTeacher => _classTeacher;

  set classTeacher(String? value) {
    _classTeacher = value;
  }

  set level(String? value) {
    _level = value;
  }

  String? get address => _address;

  set address(String? value) {
    _address = value;
  }

  List<TeachersEntity> fromJsonList(List<QueryDocumentSnapshot<Map<String, dynamic>>> courseList){
    List<TeachersDto> listCourse = [];
    listCourse.clear();
    for(var allCourse in courseList){
      listCourse.add(TeachersDto(

          address: allCourse.data()["address"],
          classTeacher: allCourse.data()["classTeacher"],
          email: allCourse.data()["email"],
          experience: allCourse.data()["experience"],
          phone: allCourse.data()["phone"],
          level: allCourse.data()["teacherLevel"],
          name: allCourse.data()["teacherName"],
          listDeCadeira: allCourse.data()["listDeCadeira"],
      ));
    }

    return listCourse;
  }



  static Map<String,dynamic> fromJson({required TeachersEntity teachersEntity}){
    return {
      "teacherName": teachersEntity.name,
      "teacherLevel": teachersEntity.level,
      "classTeacher": teachersEntity.classTeacher,
      "listDeCadeira": teachersEntity.listDeCadeira,
      "experience": teachersEntity.experience,
      "phone": teachersEntity.phone,
      "address": teachersEntity.address,
      "email": teachersEntity.email,
    };
  }

  int? get phone => _phone;

  set phone(int? value) {
    _phone = value;
  }

  String? get email => _email;

  set email(String? value) {
    _email = value;
  }

  String? get experience => _experience;

  set experience(String? value) {
    _experience = value;
  }
}
