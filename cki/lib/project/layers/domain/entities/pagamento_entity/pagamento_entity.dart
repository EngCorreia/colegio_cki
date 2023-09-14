
class Payment{
  String? _idDocument;
  int? _value;
  var _date;
  int? _status;

  Payment({int? value,var date,int?status,String? idDocument}){
   _value = value;
   _date = date;
   _status = status;
   _idDocument = idDocument;
}


  String? get idDocument => _idDocument;

  set idDocument(String? value) {
    _idDocument = value;
  }

  int? get value => _value;

  set value(int? value) {
    _value = value;
  }

  get date => _date;

  int? get status => _status;

  set status(int? value) {
    _status = value;
  }

  set date(value) {
    _date = value;
  }
}