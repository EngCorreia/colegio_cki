part of errors;
// ignore_for_file: prefer_typing_uninitialized_variables
abstract class ExceptionHelper extends Equatable implements Exception {
  const ExceptionHelper([this._message]);
  
  final   _message;

  @override
  String toString() {
    return "$_message";
  }
}

class FetchDataException extends ExceptionHelper {
  const FetchDataException([String? message]) : super(message);

  @override
  List<Object?> get props => [];
}

class BadRequestException extends ExceptionHelper {
  const BadRequestException([String? message]) : super(message);
  @override
  List<Object?> get props => [];
}

class UnauthorisedException extends ExceptionHelper {
  const UnauthorisedException([String? message]) : super(message);
  @override
  List<Object?> get props => [];
}

class InvalidInputException extends ExceptionHelper {
  const InvalidInputException([String? message]) : super(message);
  @override
  List<Object?> get props => [];
}

class NotFoundException extends ExceptionHelper {
  const NotFoundException([String? message]) : super(message);
  @override
  List<Object?> get props => [];
}

class CachedException extends ExceptionHelper {
  const CachedException([String? message]) : super(message);
  @override
  List<Object?> get props => [];
}