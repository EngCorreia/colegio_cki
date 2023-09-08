

class TurmaEntity{

  String? _classe;
  String? _nome;
  String? _periodo;
  int? _sala;


  TurmaEntity({String? classe,String? nome,String? periodo}){
_classe = classe;
_nome = nome;
_periodo = periodo;
_sala = 0;
}

  String? get classe => _classe;

  set classe(String? value) {
    _classe = value;
  }

  String? get nome => _nome;

  int? get sala => _sala;

  set sala(int? value) {
    _sala = value;
  }

  String? get periodo => _periodo;

  set periodo(String? value) {
    _periodo = value;
  }

  set nome(String? value) {
    _nome = value;
  }


}