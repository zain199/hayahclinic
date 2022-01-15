import 'package:Hayah_Clinic/modules/loginscreen/login_screen.dart';
import 'package:Hayah_Clinic/shared/constants.dart';
import 'package:Hayah_Clinic/shared/network/local/Cache_Helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

void NavigateTo(context, widget) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ));
}

void NavigateToAndKill(context, widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (route) => false,

  );
}


void toastMessage ({@required String msg,@required int state})
{
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: stateColor(state),
      textColor: Colors.white,
      fontSize: 16.0
  );
}

Color stateColor(int state)
{
  // 0 for success and 1 for warning and else for error
  if(state == 0)return Colors.green;
  else if (state == 1) return Colors.yellow;
  else return Colors.red;
}

GlobalKey navigatorKey = GlobalKey<NavigatorState>();

BuildContext getCurrentContext()
{
  return navigatorKey.currentContext;
}

void Logout(context) async
{
  uId=null;
  Cache_Helper.removeData('uId');
  FirebaseAuth.instance.signOut();
  NavigateToAndKill(context, LoginScreen());
}


