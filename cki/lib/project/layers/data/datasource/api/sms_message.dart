import 'dart:convert';
import 'package:http/http.dart' as http;

class Message{

  void messageService({required String phoneNumber,required String code}) async {
   try{
     var url = Uri.parse("https://3gl1zv.api.infobip.com/sms/2/text/advanced");
     var headers = {
       "Authorization": "App d1619201262363c8a574fb794fd115dd-d2d51aee-e3a1-41ab-93e2-ceccfeb219ca",
       "Content-Type": "application/json",
       "Accept": "application/json"
     };
     var body = '{"messages":[{"destinations":[{"to":"$phoneNumber"}],"from":"ServiceSMS",'
         '"text":"Enviamos uma menssagem para $phoneNumber.\\nDigita esta chave ( $code ) na tela de confirmação"}]}';
     var response = await http.post(url, headers: headers, body: body,);
     print(response.body);
   }catch(e){
    return;
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