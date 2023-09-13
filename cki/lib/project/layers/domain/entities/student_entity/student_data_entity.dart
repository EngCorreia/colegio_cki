
class StudentDataEntity{
  /* dados pessoas do aluno*/
  String? _id;
  String? _assignedTo;
  String? _schoolName;
  String? _studentName;
  var _date;
  var _turmaAluno;
  var _turmaId;
  String? _numberRG;
  String? _address;
  String? _motherName;
  String? _spaceJobMother;
  String? _emailMother;
  String? _phoneNumberMother;
  String? _fatherName;
  String? _spaceJobFather;
  String? _emailFather;
  String? _phoneNumberFather;
  String? _responseName;
  String? _responseObs;
  String? _classeId;
  String? _periodo;

  /* dados de saude do aluno*/

  String? _planoDeSaude;
  String? _problemaCronicoDeSaude;
  String? _alergia;
  String? _diagnosticoMedicoDificiencia;
  String? _dificuldadeMotora;
  String? _tratamento;
  String? _medicacao;
  String? _vacinas;
  String? _aconpanhamento;
  String? _numeroDeEmergencia;
  String? _outraInformacaoDeSaude;

  /* dados complementares do aluno*/

  String? _primeiroNomeComplementares;
  String? _primeiroTelefoneComplementares;
  String? _segundoNomeComplementares;
  String? _segundoTelefoneComplementares;
  String? _terceiroNomeComplementares;
  String? _terceiroTelefoneComplementares;

  String? _grupoNumero;


  StudentDataEntity({String? schoolName,String? studentName,var date,String? numberRG,String? id,
    String? address,String? motherName,String? spaceJobMother,String? emailMother,var turmaAluno,var turmaId,
    String? phoneNumberMother,String? fatherName,String? spaceJobFather,String? emailFather,
    String? phoneNumberFather,String? responseName,String? responseObs,String? classeId,String? periodo,
    String? planoDeSaude,String? problemaCronicoDeSaude,String? alergia,String? diagnosticoMedicoDificiencia,String? dificuldadeMotora,
    String? tratamento,String? medicacao,String? vacinas,String? aconpanhamento,String? numeroDeEmergencia,String? outraInformacaoDeSaude,
    String? primeiroNomeComplementares,String? primeiroTelefoneComplementares,String? segundoNomeComplementares,String? segundoTelefoneComplementares,
    String? terceiroNomeComplementares,String? terceiroTelefoneComplementares,String? grupoNumero,String? assignedTo}){
    _turmaAluno = turmaAluno;
    _turmaId = turmaId;
    _assignedTo = assignedTo;
_schoolName = schoolName;
_studentName = studentName;
_id = id;
_date = date;
_numberRG = numberRG;
_address = address;
_motherName = motherName;
_spaceJobMother = spaceJobFather;
_emailMother = emailMother;
_phoneNumberMother = phoneNumberMother;
_fatherName = fatherName;
_spaceJobFather = spaceJobFather;
_emailFather = emailFather;
_phoneNumberFather = phoneNumberFather;
_responseName = responseName;
_responseObs = responseObs;
_classeId = classeId;
_periodo = periodo;
_planoDeSaude = planoDeSaude;
_problemaCronicoDeSaude = problemaCronicoDeSaude;
_alergia = alergia;
_diagnosticoMedicoDificiencia = diagnosticoMedicoDificiencia;
_dificuldadeMotora = dificuldadeMotora;
_tratamento = tratamento;
_medicacao = medicacao;
_vacinas = vacinas;
_aconpanhamento = aconpanhamento;
_numeroDeEmergencia = numeroDeEmergencia;
_outraInformacaoDeSaude = outraInformacaoDeSaude;
_primeiroNomeComplementares = primeiroNomeComplementares;
_primeiroTelefoneComplementares = primeiroTelefoneComplementares;
_segundoNomeComplementares = segundoNomeComplementares;
_segundoTelefoneComplementares = segundoTelefoneComplementares;
_terceiroNomeComplementares = terceiroNomeComplementares;
_terceiroTelefoneComplementares = terceiroTelefoneComplementares;
_grupoNumero = grupoNumero;

  }

  get turmaAluno => _turmaAluno;

  set turmaAluno(value) {
    _turmaAluno = value;
  }

  String? get id => _id;

  set id(String? value) {
    _id = value;
  }

  String? get planoDeSaude => _planoDeSaude;

  set planoDeSaude(String? value) {
    _planoDeSaude = value;
  }

  String? get classeId => _classeId;

  set classeId(String? value) {
    _classeId = value;
  }

  String? get schoolName => _schoolName;

  set schoolName(String? value) {
    _schoolName = value;
  }

  String? get studentName => _studentName;

  String? get responseObs => _responseObs;

  set responseObs(String? value) {
    _responseObs = value;
  }

  String? get responseName => _responseName;

  set responseName(String? value) {
    _responseName = value;
  }

  String? get phoneNumberFather => _phoneNumberFather;

  set phoneNumberFather(String? value) {
    _phoneNumberFather = value;
  }

  String? get emailFather => _emailFather;

  set emailFather(String? value) {
    _emailFather = value;
  }

  String? get spaceJobFather => _spaceJobFather;

  set spaceJobFather(String? value) {
    _spaceJobFather = value;
  }

  String? get fatherName => _fatherName;

  set fatherName(String? value) {
    _fatherName = value;
  }

  String? get phoneNumberMother => _phoneNumberMother;

  set phoneNumberMother(String? value) {
    _phoneNumberMother = value;
  }

  String? get emailMother => _emailMother;

  set emailMother(String? value) {
    _emailMother = value;
  }

  String? get spaceJobMother => _spaceJobMother;

  set spaceJobMother(String? value) {
    _spaceJobMother = value;
  }

  String? get motherName => _motherName;

  set motherName(String? value) {
    _motherName = value;
  }

  String? get address => _address;

  set address(String? value) {
    _address = value;
  }

  String? get numberRG => _numberRG;

  set numberRG(String? value) {
    _numberRG = value;
  }

  get date => _date;

  set date(value) {
    _date = value;
  }

  set studentName(String? value) {
    _studentName = value;
  }

  String? get periodo => _periodo;

  set periodo(String? value) {
    _periodo = value;
  }

  String? get problemaCronicoDeSaude => _problemaCronicoDeSaude;

  set problemaCronicoDeSaude(String? value) {
    _problemaCronicoDeSaude = value;
  }

  String? get alergia => _alergia;

  set alergia(String? value) {
    _alergia = value;
  }

  String? get diagnosticoMedicoDificiencia => _diagnosticoMedicoDificiencia;

  set diagnosticoMedicoDificiencia(String? value) {
    _diagnosticoMedicoDificiencia = value;
  }

  String? get dificuldadeMotora => _dificuldadeMotora;

  set dificuldadeMotora(String? value) {
    _dificuldadeMotora = value;
  }

  String? get tratamento => _tratamento;

  set tratamento(String? value) {
    _tratamento = value;
  }

  String? get medicacao => _medicacao;

  set medicacao(String? value) {
    _medicacao = value;
  }

  String? get vacinas => _vacinas;

  set vacinas(String? value) {
    _vacinas = value;
  }

  String? get aconpanhamento => _aconpanhamento;

  set aconpanhamento(String? value) {
    _aconpanhamento = value;
  }

  String? get numeroDeEmergencia => _numeroDeEmergencia;

  set numeroDeEmergencia(String? value) {
    _numeroDeEmergencia = value;
  }

  String? get outraInformacaoDeSaude => _outraInformacaoDeSaude;

  set outraInformacaoDeSaude(String? value) {
    _outraInformacaoDeSaude = value;
  }

  String? get primeiroNomeComplementares => _primeiroNomeComplementares;

  set primeiroNomeComplementares(String? value) {
    _primeiroNomeComplementares = value;
  }

  String? get primeiroTelefoneComplementares => _primeiroTelefoneComplementares;

  set primeiroTelefoneComplementares(String? value) {
    _primeiroTelefoneComplementares = value;
  }

  String? get segundoNomeComplementares => _segundoNomeComplementares;

  set segundoNomeComplementares(String? value) {
    _segundoNomeComplementares = value;
  }

  String? get segundoTelefoneComplementares => _segundoTelefoneComplementares;

  set segundoTelefoneComplementares(String? value) {
    _segundoTelefoneComplementares = value;
  }

  String? get terceiroNomeComplementares => _terceiroNomeComplementares;

  set terceiroNomeComplementares(String? value) {
    _terceiroNomeComplementares = value;
  }

  String? get terceiroTelefoneComplementares => _terceiroTelefoneComplementares;

  set terceiroTelefoneComplementares(String? value) {
    _terceiroTelefoneComplementares = value;
  }

  String? get grupoNumero => _grupoNumero;

  set grupoNumero(String? value) {
    _grupoNumero = value;
  }

  get turmaId => _turmaId;

  set turmaId(value) {
    _turmaId = value;
  }

  String? get assignedTo => _assignedTo;

  set assignedTo(String? value) {
    _assignedTo = value;
  }
}