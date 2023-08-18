

class LoginParam{
  String? _displayName;
  String? _email;
  String? _phoneNumber;
  String? _photoURL;
  String? _uid;


  LoginParam({String? displayName,String? email,String? phoneNumber,
    String? photoURL,String? uid}){
    _displayName = displayName;
    _email = email;
    _phoneNumber = phoneNumber;
    _photoURL = photoURL;
    _uid = uid;
  }



  String? get displayName => _displayName;

  set displayName(String? value) {
    _displayName = value;
  }

  String? get email => _email;

  String? get uid => _uid;

  set uid(String? value) {
    _uid = value;
  }

  String? get photoURL => _photoURL;

  set photoURL(String? value) {
    _photoURL = value;
  }

  String? get phoneNumber => _phoneNumber;

  set phoneNumber(String? value) {
    _phoneNumber = value;
  }

  set email(String? value) {
    _email = value;
  }
}