import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class Message{

  Future<bool> messageService({required String phoneNumber,required String code}) async {
   try{
     var url = Uri.parse("https://3gl1zv.api.infobip.com/sms/2/text/advanced");
     var headers = {
       "Authorization": "App d1619201262363c8a574fb794fd115dd-d2d51aee-e3a1-41ab-93e2-ceccfeb219ca",
       "Content-Type": "application/json",
       "Accept": "application/json"
     };
     var body = '{"messages":[{"destinations":[{"to":"$phoneNumber"}],"from":"ServiceSMS",'
         '"text":"C.K.I Código de válidação de conta é : ( $code ).\\nDigita esta chave  na tela de confirmação"}]}';
     var response = await http.post(url, headers: headers, body: body,);
     if(response.statusCode == 200 || response.statusCode == 201){
       return true;
     }else{
       return false;
     }
   }catch(e){
    return false;
   }
  }

  Future<bool> netSmsService({required String phoneNumber,required String code}) async {

    try{
      var url = Uri.parse("https://netsms.co.ao/app/appi/");
      var headers = {
        "Content-Type": "application/json",
        "Accept": "application/json"
      };
      var json = {
        "mensagem":{
          "accao": "enviar_sms",
          "chave_entidade": "2cfTdJSF65E5HsK6ge6e5dY256s",
          "destinatario": "+244924948647",
          "descricao_sms": "C.K.I Código de válidação de conta é : ( $code ).\\nDigita esta chave  na tela de confirmação"
        }
      };
      log("********************ssssss ${jsonDecode(json.toString())}");
      var response = await http.post(url,headers: headers,body: json.toString());
        log("******************** ${response.body}");
        return true;
    }catch(e){
      log("******************** erro $e");
      return false;
    }
  }



  void whatSapMsn({required String phoneNumber}) async {
    var url = Uri.parse("https://3gl1zv.api.infobip.com/whatsapp/1/message/template");
    var headers = {
      "Authorization": "App d1619201262363c8a574fb794fd115dd-d2d51aee-e3a1-41ab-93e2-ceccfeb219ca",
      "Content-Type": "application/json",
      "Accept": "application/json"
    };
    var body = jsonEncode({
      "messages": [
        {
          "from": "447860099299",
          "to": phoneNumber,
          "messageId": "66fe2f6e-159a-4e43-b264-3533c9fd1ec9",
          "content": {
            "templateName": "message_test",
            "templateData": {
              "body": {
                "placeholders": ["Correia"]
              }
            },
            "language": "en"
          }
        }
      ]
    });

    var response = await http.post(url, headers: headers, body: body,
    );

    print(response.body);
  }
}