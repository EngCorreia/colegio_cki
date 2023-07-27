

import 'application_error.dart';

class SaveTeacherError implements ApplicationError{

  final String? message;
  SaveTeacherError(this.message);


}