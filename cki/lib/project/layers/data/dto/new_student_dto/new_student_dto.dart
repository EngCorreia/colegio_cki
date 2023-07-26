import '../../../domain/entities/student_entity/student_data_entity.dart';



class StudentDto extends StudentDataEntity{
  String? _schoolName;
  String? _studentName;
  var _date;
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


  StudentDto({String? classeId,String? periodo,String? schoolName,String? studentName,var date,String? numberRG,
    String? address,String? motherName,String? spaceJobMother,String? emailMother,
    String? phoneNumberMother,String? fatherName,String? spaceJobFather,String? emailFather,
    String? phoneNumberFather,String? responseName,String? responseObs}) : super(
    date: date,
    address: address,
    emailFather: emailFather,
    emailMother: emailMother,
    fatherName: fatherName,
    motherName: motherName,
    numberRG: numberRG,
    phoneNumberFather: phoneNumberFather,
    phoneNumberMother: phoneNumberMother,
    responseName: responseName,
    responseObs: responseObs,
    schoolName: schoolName,
    spaceJobFather: spaceJobFather,
    spaceJobMother: spaceJobMother,
    studentName: studentName,
      classeId: classeId,
    periodo: periodo
  ){
    _schoolName = schoolName;
    _studentName = studentName;
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
    _periodo = periodo;
    _classeId = classeId;
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


  String? get classeId => _classeId;

  set classeId(String? value) {
    _classeId = value;
  }

  String? get periodo => _periodo;

  set periodo(String? value) {
    _periodo = value;
  }

  static Map<String,dynamic> fromJson(StudentDataEntity studentDataEntity){
    return {
      // dados pessoais do aluno
      "nome_aluno": studentDataEntity.studentName,
      "data_nascimento": studentDataEntity.date,
      "registro_certidao": studentDataEntity.numberRG,
      "endereco": studentDataEntity.address,
      "nome_mae": studentDataEntity.motherName,
      "mae_trabalho": studentDataEntity.spaceJobMother,
      "mae_email": studentDataEntity.emailMother,
      "mae_telefone": studentDataEntity.phoneNumberMother,
      "nome_pai": studentDataEntity.fatherName,
      "pai_trabalho": studentDataEntity.spaceJobFather,
      "pai_email": studentDataEntity.emailFather,
      "pai_telefone": studentDataEntity.phoneNumberFather,
      "nome_responsavel": studentDataEntity.responseName,
      "obs": studentDataEntity.responseObs,
      "classe": {"classeName": studentDataEntity.classeId,
                 "periodo": "Manhã"},

      // Dados de saude do aluno
     // "obs": studentDataEntity.responseObs,

    };
  }

}