import 'package:Hayah_Clinic/layout/cubit/home_cubit_states.dart';
import 'package:Hayah_Clinic/models/login_model.dart';
import 'package:Hayah_Clinic/shared/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);

  static int bottomNavItemIndex = 0;

  void setBottomNavItemIndex(int index) {
      bottomNavItemIndex = index;
      emit(HomeBottomNavIndexState());
  }

  LoginModel model;

  void getUserData() {
    emit(HomeGetUserLoadingState());
    if(uId!=null)
      {
        FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
          model = LoginModel.fromJson(value.data());
          emit(HomeGetUserSuccessState());
        }).catchError((onError) {
          print(onError.toString());
          emit(HomeGetUserErrorState());
        });
      }
  }



}
