import 'dart:developer';

import 'package:mysql1/mysql1.dart';

class Connection{

      openDatabase() async {

      try{
        var connection = await MySqlConnection.connect(ConnectionSettings(
          host: "10.0.2.2",
          user: "root",
          password: "",
          port: 3306,
          db: "ministerio",
          useSSL: false,
        ));
        var result = await connection.query("select * from usuario");
        log("*****1 $result");
        await connection.close();

      }catch(e){
        log("***** ${e.toString()}");
      }

      }
}