part of errors;
// ignore_for_file: prefer_typing_uninitialized_variables
abstract class Failure extends Equatable {
  const Failure([this._message]);

  final _message;

  @override
  String toString() {
    return '$_message';
  }
}


class FetchDataFailure extends Failure {
 const FetchDataFailure([String? message]) : super(message);
  
   @override
  List<Object?> get props => [];
}