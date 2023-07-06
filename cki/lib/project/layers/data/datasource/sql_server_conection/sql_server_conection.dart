import 'dart:developer';

import 'package:mysql1/mysql1.dart';

class Connection{

      openDatabase() async {
      try{
        var connection = await MySqlConnection.connect(ConnectionSettings(
          host: "localhost",
          user: "root",
          password: "",
          port: 3306,
          db: "ministerio",
          useSSL: false,
        ));
        var result = await connection.query("select * from usuario");
        log("***** $result");

      }catch(e){
        log("***** ${e.toString()}");
      }

      }
}