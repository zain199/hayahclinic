import 'package:Hayah_Clinic/layout/home_layout.dart';
import 'package:Hayah_Clinic/models/login_model.dart';
import 'package:Hayah_Clinic/modules/register_screen/cubit/register_cubit_states.dart';
import 'package:Hayah_Clinic/shared/constants.dart';
import 'package:Hayah_Clinic/shared/network/local/Cache_Helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/methods.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitalState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;

  void setVis() {
    isPassword = !isPassword;
    emit(RegisterChangeVisPassState());
  }


  void createUserRegister({@required context,@required String name,@required String phone,@required String email,@required String password,}) {
      emit(RegisterLoadingState());

      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      ).then((value) {
        print(value.user.email + " "+value.user.uid);
        uId = value.user.uid;
        Cache_Helper.setData('uid', uId);
        saveUserRegister(
          uid: value.user.uid,
          email:email,
          name: name,
          phone: phone,
          image:'https://image.freepik.com/free-photo/portrait-smiling-young-man-eyewear_171337-4842.jpg',
        );
        NavigateToAndKill(context,HomeLayout());
        emit(RegisterSuccessState(false));
      }).catchError((onError){

        emit(RegisterErrorState());
      });
  }

  void saveUserRegister({
    @required context,
    @required String name,
    @required String phone,
    @required String email,
    @required String uid,
    @required String image,
  }) {
    emit(RegisterLoadingState());
    Map<String,dynamic> data =LoginModel(name,phone,email,uid,image).toMap();
    FirebaseFirestore.instance.collection('users').doc(uid).set(
      data
    ).then((value) {

      emit(RegisterSuccessState(true));
    }).catchError((onError){
      print(onError.toString());
      emit(RegisterErrorState());
    });
  }

}
