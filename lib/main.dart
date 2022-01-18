import 'package:Hayah_Clinic/layout/cubit/home_cubit.dart';
import 'package:Hayah_Clinic/layout/cubit/home_cubit_states.dart';
import 'package:Hayah_Clinic/layout/home_layout.dart';
import 'package:Hayah_Clinic/modules/loginscreen/login_screen.dart';
import 'package:Hayah_Clinic/shared/blocobcerver.dart';
import 'package:Hayah_Clinic/shared/constants.dart';
import 'package:Hayah_Clinic/shared/methods.dart';
import 'package:Hayah_Clinic/shared/network/local/Cache_Helper.dart';
import 'package:Hayah_Clinic/shared/styles/theme.dart';
import 'package:connectivity/connectivity.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'modules/noInternet/noInternetScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await Cache_Helper.init();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  Widget screen;

  @override
  Widget build(BuildContext context) {
    getInitialData();
    checkWhichScreen();
    return StreamBuilder(
      stream: Connectivity().onConnectivityChanged,
      builder: (context, snapshot) {
        if(snapshot==null)
        {
          return const Center(child: CircularProgressIndicator(),);
        }
        var resualt = snapshot.data;
        switch(resualt){
          case ConnectivityResult.mobile:
          case ConnectivityResult.wifi:
            return  BlocProvider(
                create: (context) => HomeCubit(),
                child:MaterialApp(
                  useInheritedMediaQuery: true,
                  locale: DevicePreview.locale(context),
                  builder: (context, widget) => ResponsiveWrapper.builder(
                      BouncingScrollWrapper(child: widget),
                      minWidth: 360.0,
                      defaultScale: true,
                      breakpoints:const  [
                        ResponsiveBreakpoint.autoScale(480, name: MOBILE),
                        ResponsiveBreakpoint.autoScale(800, name: TABLET,scaleFactor: 1.5),
                        ResponsiveBreakpoint.autoScale(1000, name: 'L TABLET' ,scaleFactor: 1.6),
                        ResponsiveBreakpoint.autoScale(1500, name: DESKTOP ,scaleFactor: 1.7),
                      ],

                  ),
                  debugShowCheckedModeBanner: false,
                  theme:darkTheme,

                  home: screen,
                )
            );
          case ConnectivityResult.none:
          default:
            return NoInternetScreen();
        }
      },

    );
  }

  void checkWhichScreen() {
    if (uId != null) {
      screen = HomeLayout();
    } else
      screen = LoginScreen();
  }

  void getInitialData() {
    uId = Cache_Helper.getData('uid');
  }
}
