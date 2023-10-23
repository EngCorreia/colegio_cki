
import 'package:mobx/mobx.dart';
part 'status.g.dart';

class Status = _Status with _$Status;
abstract class _Status with Store{

  @observable
  String? _status;

  String? get status => _status;

  @action
  setStatus(String? value) {
    _status = value;
  }

  @action
  _Status({String? status}){
    _status = status;
  }
}