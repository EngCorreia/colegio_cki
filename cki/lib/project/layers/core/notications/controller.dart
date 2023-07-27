
import 'package:cloud_firestore/cloud_firestore.dart';
import 'model.dart';
import 'not.dart';

Future<void> notification() async {
/*
  try {
    int cout = 0;
    var data = await FirebaseFirestore.instance.collection("notification").snapshots();
    data.listen((querySnapshot) {
      var map = querySnapshot.docs;
     // myRequest.clear();
      for (var item in map) {
        Map<String, dynamic> data = item.data() as Map<String, dynamic>;
        var result = NotificationDTO.fromJson(data);
      //  myRequest.add(result);
        if (result.idrecept == "" && result.visible == false && result.idsend != "" && UserMedafModel.userProfile! && UserMedafModel.driver == false && UserMedafModel.userId != "") {

          AwesomeNotifications().createNotification(
              content: NotificationContent(
                  id: 10,
                  channelKey: 'basic_channel',
                  title: result.title,
                  body: result.body,
                  actionType: ActionType.Default));

          if (result.idrecept == "") {
            result.idrecept = item.id;
            update(result);
          }

        } else if (result.idrecept == UserMedafModel.userId && UserMedafModel.userProfile! && UserMedafModel.driver == false && result.visible == false) {

          AwesomeNotifications().createNotification(
              content: NotificationContent(
                  id: 10,
                  channelKey: 'basic_channel',
                  title: result.title,
                  body: result.body,
                  actionType: ActionType.Default));
                update(result);

        } else if (result.idrecept == UserMedafModel.userId && result.visible == false) {

          AwesomeNotifications().createNotification(
              content: NotificationContent(
                  id: 10,
                  channelKey: 'basic_channel',
                  title: result.title,
                  body: result.body,
                  actionType: ActionType.Default));
                 update(result);

        } else {

        }
      }
      cout = 0;
    });

  } catch (e) {
    print("Erro ao acompanhar realTime");
  }

  */

}

Future<void> update(NotificationModell notificationModel) async {

  try {
    var data = await FirebaseFirestore.instance.collection("notification").doc(notificationModel.idrecept);

    data.update(NotificationDTO(
        date: Timestamp.fromDate(DateTime.now()),
        body: notificationModel.body,
        visible: true,
        title: notificationModel.title,
        subtitle: notificationModel.subtitle,
        icon: notificationModel.icon,
        idrecept: notificationModel.idrecept,
        idsend: notificationModel.idsend)
        .toJson());

  } catch (e) {
    print(e);
  }
}

Future<void> setNotification(NotificationModell notificationModel) async {

  try {
    var data = await FirebaseFirestore.instance.collection("notification").doc();
    data.set(NotificationDTO(
        date: Timestamp.fromDate(DateTime.now()),
        body: notificationModel.body,
        title: notificationModel.title,
        visible: notificationModel.visible,
        subtitle: notificationModel.subtitle,
        icon: notificationModel.icon,
        idrecept: notificationModel.idrecept,
        idsend: notificationModel.idsend).toJson());

  } catch (e) {
    print(e);
  }

}