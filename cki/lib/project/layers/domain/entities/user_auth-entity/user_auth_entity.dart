

class UserAuthEntity{
  String? _displayName;
  String? _email;
  bool? _emailVerified;
  String? _phoneNumber;
  String? _photoURL;
  String? _uid;


  UserAuthEntity({String? displayName,String? email,bool? emailVerified,String? phoneNumber,
    String? photoURL,String? uid}){
    _displayName = displayName;
    _email = email;
    _emailVerified = emailVerified;
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

  bool? get emailVerified => _emailVerified;

  set emailVerified(bool? value) {
    _emailVerified = value;
  }

  set email(String? value) {
    _email = value;
  }
}