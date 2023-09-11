

class TurmaEntity{
  String? _id;
  String? _classe;
  String? _nome;
  String? _periodo;
  int? _sala;

  TurmaEntity({String? id,String? classe,String? nome,String? periodo,int? sala}){
    _id = id;
    _classe = classe;
    _nome = nome;
    _periodo = periodo;
    _sala = sala;
}

  String? get id => _id;

  set id(String? value) {
    _id = value;
  }

  String? get classe => _classe;

  int? get sala => _sala;

  set sala(int? value) {
    _sala = value;
  }

  String? get periodo => _periodo;

  set periodo(String? value) {
    _periodo = value;
  }

  String? get nome => _nome;

  set nome(String? value) {
    _nome = value;
  }

  set classe(String? value) {
    _classe = value;
  }
}