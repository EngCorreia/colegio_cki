



import '../../../domain/entities/teachers_entity/teachers_entity.dart';

class TeachersDto extends TeachersEntity{
  String? _name;
  String? _level;
  String? _classTeacher;
  List<String>? _listDeCadeira;

  TeachersDto({String? name,String? level,String? classTeacher,List<String>? listDeCadeira}) : super(
    name: name,
    classTeacher: classTeacher,
    level: level,
     listDeCadeira: listDeCadeira,
  ){
    _name = name;
    _level = level;
    _classTeacher = classTeacher;
    _listDeCadeira = listDeCadeira;
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



  static Map<String,dynamic> fromJson({required TeachersEntity teachersEntity}){
    return {
      "teacherName": teachersEntity.name,
      "teacherLevel": teachersEntity.level,
      "classTeacher": teachersEntity.classTeacher,
      "listDeCadeira": teachersEntity.listDeCadeira
    };
  }
}
