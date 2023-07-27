import 'application_error.dart';

class SaveStudentError implements ApplicationError{

  final String? message;
  SaveStudentError(this.message);

}