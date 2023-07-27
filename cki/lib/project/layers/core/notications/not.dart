import 'package:cloud_firestore/cloud_firestore.dart';

import 'model.dart';

class NotificationDTO extends NotificationModell {

  String? idsend;

  String? idrecept;

  String? title;

  String? subtitle;

  String? body;

  String? icon;

  Timestamp? date;

  bool ? visible;




  NotificationDTO({

    required this.idsend,

    required this.idrecept,

    required this.title,

    required this.subtitle,

    required this.body,

    required this.icon,

    required this.date,

    required this.visible

  }) : super(

      title: title,

      subtitle: subtitle,

      body: body,

      icon: icon,

      date: date,

      idsend: idsend,

      idrecept: idrecept,

      visible:visible

  );




  factory NotificationDTO.fromModel(NotificationModell model) {

    return NotificationDTO(

      title: model.title,

      subtitle: model.subtitle,

      body: model.body,

      icon: model.icon,

      date: model.date, idrecept: model.idrecept, idsend: model.idsend, visible: model.visible,

    );

  }




  factory NotificationDTO.fromJson(Map<String, dynamic> json) {

    return NotificationDTO(
      title: json['title'],
      subtitle: json['subtitle'],
      body: json['body'],
      icon: json['icon'],
      date: json['date'],
      idrecept:json['idrecept'],
      idsend: json['idsend'], visible: json['visible'] ?? false,
    );

  }




  Map<String, dynamic> toJson() {

    return {

      'title': title,

      'subtitle': subtitle,

      'body': body,

      'icon': icon,

      'date': date,

      'idrecept':idrecept,

      'idsend':idsend,

      'visible':visible

    };

  }

}