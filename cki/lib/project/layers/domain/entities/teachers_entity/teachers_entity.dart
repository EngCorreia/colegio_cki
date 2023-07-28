

class TeachersEntity{
  String? _name;
  String? _address;
  int? _phone;
  String? _level;
  String? _email;
  String? _classTeacher;
  String? _experience;
  List<String>? _listDeCadeira;

  TeachersEntity({String? name,int? phone,String? email,String? level,String? address,String? classTeacher,String? experience,List<String>? listDeCadeira}){
  _name = name;
  _level = level;
  _classTeacher = classTeacher;
  _listDeCadeira = listDeCadeira;
  _address = address;
  _phone = phone;
  _experience = experience;
  _email = email;
}


  String? get email => _email;

  set email(String? value) {
    _email = value;
  }

  String? get experience => _experience;

  set experience(String? value) {
    _experience = value;
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

  int? get phone => _phone;

  set phone(int? value) {
    _phone = value;
  }

  String? get address => _address;

  set address(String? value) {
    _address = value;
  }
}