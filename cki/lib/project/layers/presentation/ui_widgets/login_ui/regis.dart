import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signInWithPhoneNumber(String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Se a verificação for concluída automaticamente (por exemplo, em dispositivos de teste), esse callback será chamado.
          // Você pode usar credential para autenticar diretamente o usuário.
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          // Se houver um erro durante a verificação do número de telefone.
          print('Erro durante a verificação do número de telefone: ${e.message}');
        },
        codeSent: (String verificationId, int? resendToken) {
          // Este callback é invocado quando o código de verificação é enviado com sucesso para o número de telefone fornecido.
          // Aqui você pode pedir ao usuário para inserir o código de verificação enviado.
          // Você também pode armazenar verificationId para usar posteriormente na verificação do código.
          // resendToken pode ser usado para reenviar o código de verificação.
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Este callback é invocado quando o tempo limite da recuperação automática do código de verificação é atingido.
          // Você pode fazer o que quiser aqui, como solicitar ao usuário que insira manualmente o código de verificação.
        },
        timeout: Duration(seconds: 60), // Tempo limite para a verificação do número de telefone.
      );
      return true; // Retornar verdadeiro se a solicitação for bem-sucedida.
    } catch (e) {
      print('Erro durante a solicitação de verificação do número de telefone: $e');
      return false; // Retornar falso se houver um erro.
    }
  }
}