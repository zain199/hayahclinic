import 'package:Hayah_Clinic/layout/home_layout.dart';
import 'package:Hayah_Clinic/modules/loginscreen/cubit/login_cubit_states.dart';
import 'package:Hayah_Clinic/shared/constants.dart';
import 'package:Hayah_Clinic/shared/methods.dart';
import 'package:Hayah_Clinic/shared/network/local/Cache_Helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;

  void setVis() {
    isPassword = !isPassword;
    emit(LoginChangeVisPassState());
  }

  final googleSignIn = GoogleSignIn();
  Future userGoogleLogin(context) async
  {

    final user = await googleSignIn.signIn();
    if (user == null) {
      return;
    } else {
      final googleAuth = await user.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      FirebaseAuth.instance.signInWithCredential(credential).then((value) {

        if(value.user.uid!=null)
        {
          //toastMessage(msg: value.user.email, state: 0);
          uId = value.user.uid;
          Cache_Helper.setData('uid', uId);
          NavigateToAndKill(context, HomeLayout());
        }
        emit(LoginSuccessState(true));

      });

    }
  }


  void userLogin({@required context,@required email, @required password}) {
    emit(LoginLoadingState());

    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      if(value.user.uid!=null)
        {
          //toastMessage(msg: value.user.email, state: 0);
          uId = value.user.uid;
          Cache_Helper.setData('uid', uId);
          NavigateToAndKill(context, HomeLayout());
        }
      emit(LoginSuccessState(true));
    }).catchError((onError){
      toastMessage(msg: onError.toString(), state: 2);
      emit(LoginErrorState());
    });


  }
}
