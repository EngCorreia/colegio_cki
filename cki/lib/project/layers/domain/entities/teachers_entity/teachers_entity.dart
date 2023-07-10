

class Teachers{
  String? _name;
  String? _level;
  String? _classTeacher;
  List<String>? _listDeCadeira;

  Teachers({String? name,String? level,String? classTeacher,List<String>? listDeCadeira}){
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
}