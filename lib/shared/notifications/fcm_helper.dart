import 'package:firebase_messaging/firebase_messaging.dart';
import '../constants.dart';

class Fcm_Helper {

  static init()
  {
    Fcm_Helper.getNotificationWhenOpenedApp();
    Fcm_Helper.getNotificationWhenBackgroundedApp();
  }

  static void getNotificationWhenOpenedApp(){
    FirebaseMessaging.onMessage.listen((event)async {

    });
  }


  static Future<void> backHandler(RemoteMessage event) async
  {
    if(event.notification!=null)
    {
     }
  }

  static void getNotificationWhenBackgroundedApp(){
    FirebaseMessaging.onBackgroundMessage(backHandler);
  }

}