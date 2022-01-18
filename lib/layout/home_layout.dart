

import 'package:Hayah_Clinic/layout/cubit/home_cubit.dart';
import 'package:Hayah_Clinic/layout/cubit/home_cubit_states.dart';
import 'package:Hayah_Clinic/shared/methods.dart';
import 'package:Hayah_Clinic/shared/styles/icon_broken.dart';
import 'package:Hayah_Clinic/shared/widgets/DefualtTextButton.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {

 bool first =false;

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
     return BlocConsumer<HomeCubit, HomeStates>(

       listener: (context, state) {

       },
       builder: (context, state) {

         if(!first){
           cubit.getUserData();
           HomeCubit.bottomNavItemIndex=0;
           first=true;
         }
         return Scaffold(
           extendBody: true,
           bottomNavigationBar:  CurvedNavigationBar(

             color: Colors.grey[300],
             buttonBackgroundColor: Colors.orange[300],
             backgroundColor: Colors.transparent,
             animationDuration: Duration(milliseconds: 200),
             height: 45.0,
             items: [
               Icon( IconBroken.Home,size:30.0,),
               Icon(IconBroken.Chat,size: 30.0,),
               Icon(IconBroken.Plus,size:30.0,),
               Icon(IconBroken.User,size: 30.0,),
             ],
             onTap: (index) {
               cubit.setBottomNavItemIndex(index);
             },

             index:  HomeCubit.bottomNavItemIndex ,

           ),

             body: SafeArea(
               child: DefaultButton(
                 child: Text('logout'),
                 fun: (){
                   Logout(context);
                 },
               ),
             )
           // ConditionalBuilder(
           //   condition: cubit.model!=null,
           //   builder: (context) =>cubit.screens[HomeCubit.bottomNavItemIndex] ,
           //   fallback: (context)=>Center(child: CircularProgressIndicator()),
           // ),
         );
       },
     );
   }
  }



