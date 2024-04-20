
class StudentInformation{

  static  String? _name = "";
  static  String? _userID = "";
  static  String? _photo = "";
  static  String? _phoneNumber = "";
  static int _screenState = 2;
  static int _status = 0;


  static int get status => _status;

  static set status(int value) {
    _status = value;
  }

  static int get screenState => _screenState;

  static set screenState(int value) {
    _screenState = value;
  }

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