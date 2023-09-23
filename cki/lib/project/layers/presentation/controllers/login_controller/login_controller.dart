
import 'dart:developer';
import 'package:cki/project/layers/domain/usecases/login_usecase/login_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../../core/show_toast_message/show_toast_message.dart';
import '../../../domain/entities/logim_param/login_param.dart';

class LoginController {

  final Login _login;
  LoginController(this._login);

  @observable
  int? status;

  @computed
  int? get newStatusUser => status;

  Future<void> loginUser() async {
    var result = await _login(param: LoginParam());
    result.fold((error) => log("**** error controller $error"),
            (success){
          ShowToast.show_message_Success("Inscrição feita com sucesso...");
        });
  }
}