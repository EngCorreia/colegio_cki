
class StudentInformation{

  static  String? _name = "";
  static  String? _userID = "";
  static  String? _photo = "";
  static  String? _phoneNumber = "";


  static String? get photo => _photo;

  static set photo(String? value) {
    _photo = value;
  }

  static String? get name => _name;

  static set name(String? value) {
    _name = value;
  }

  static String? get userID => _userID;

  static set userID(String? value) {
    _userID = value;
  }

  static String? get phoneNumber => _phoneNumber;

  static set phoneNumber(String? value) {
    _phoneNumber = value;
  }
}