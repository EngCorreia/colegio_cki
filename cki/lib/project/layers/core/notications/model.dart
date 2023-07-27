import 'package:cloud_firestore/cloud_firestore.dart';




class NotificationModell {

  bool? _visible;

  String? _title;

  String? _subtitle;

  String? _body;

  String? _icon;

  String? _idsend;

  String? _idrecept;

  Timestamp? _date;




  NotificationModell({

    required String? title,

    required bool? visible,

    required String? subtitle,

    required String? body,

    required String? icon,

    required Timestamp? date,

    required String? idsend,

    required String? idrecept,

  }) {

    _title = title;

    _subtitle = subtitle;

    _body = body;

    _icon = icon;

    _date = date;

    _idsend = idsend;

    _idrecept = idrecept;

    _visible=visible;

  }




  String? get title => _title;

  set title(String? value) {

    _title = value;

  }




  bool? get visible => _visible;

  set visible(bool? value) {

    _visible = value;

  }




  String? get idrecept => _idrecept;

  set idrecept(String? value) {

    _idrecept = value;

  }




  String? get idsend => _idsend;

  set idsend(String? value) {

    _idsend = value;

  }




  Timestamp? get date => _date;

  set date(Timestamp? value) {

    _date = value;

  }




  String? get icon => _icon;

  set icon(String? value) {

    _icon = value;

  }




  String? get body => _body;

  set body(String? value) {

    _body = value;

  }




  String? get subtitle => _subtitle;

  set subtitle(String? value) {

    _subtitle = value;

  }

}