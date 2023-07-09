
class StudentDataEntity{
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


  StudentDataEntity({String? schoolName,String? studentName,var date,String? numberRG,
    String? address,String? motherName,String? spaceJobMother,String? emailMother,
    String? phoneNumberMother,String? fatherName,String? spaceJobFather,String? emailFather,
    String? phoneNumberFather,String? responseName,String? responseObs}){
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
}