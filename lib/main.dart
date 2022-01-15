
import 'package:Hayah_Clinic/layout/cubit/home_cubit.dart';
import 'package:Hayah_Clinic/layout/cubit/home_cubit_states.dart';
import 'package:Hayah_Clinic/layout/home_layout.dart';
import 'package:Hayah_Clinic/modules/loginscreen/login_screen.dart';
import 'package:Hayah_Clinic/shared/blocobcerver.dart';
import 'package:Hayah_Clinic/shared/constants.dart';
import 'package:Hayah_Clinic/shared/methods.dart';
import 'package:Hayah_Clinic/shared/network/local/Cache_Helper.dart';
import 'package:Hayah_Clinic/shared/styles/theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await Cache_Helper.init();


  runApp(
      DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  Widget screen;

  @override
  Widget build(BuildContext context) {
    getInitialData();
    checkWhichScreen();
    return BlocProvider(
        create: (context) => HomeCubit(),
        child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              navigatorKey: navigatorKey,
              useInheritedMediaQuery: true,
              locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,
              debugShowCheckedModeBanner: false,
              theme: darkTheme,
              home: screen,
            );
          },
        ));
  }


   void checkWhichScreen()
  {
    if (uId != null) {
      screen = HomeLayout();
    } else
      screen = LoginScreen();
  }

  void getInitialData()
  {
    uId = Cache_Helper.getData('uid');
  }
}
