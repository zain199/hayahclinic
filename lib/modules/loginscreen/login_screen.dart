

import 'package:Hayah_Clinic/modules/loginscreen/cubit/login_cubit.dart';
import 'package:Hayah_Clinic/modules/loginscreen/cubit/login_cubit_states.dart';
import 'package:Hayah_Clinic/modules/register_screen/register_screen.dart';
import 'package:Hayah_Clinic/shared/methods.dart';
import 'package:Hayah_Clinic/shared/widgets/DefualtTextButton.dart';
import 'package:Hayah_Clinic/shared/widgets/DefualtTextFormField.dart';
import 'package:Hayah_Clinic/shared/widgets/GoogleSignInButton.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


 class LoginScreen extends StatelessWidget {
   final TextEditingController email = TextEditingController();
   final  TextEditingController pass = TextEditingController();
   final GlobalKey<FormState>  keysss = GlobalKey<FormState>();




   @override
   Widget build(BuildContext context) {

     return BlocProvider(
       create: (context) => LoginCubit(),
       child: BlocConsumer<LoginCubit,LoginStates>(
         listener: (context, state) {

         },
         builder: (context, state) {
           var cubit = LoginCubit.get(context);
           return Scaffold(
             appBar: AppBar(),
             body: Center(
               child: Form(
                 key: keysss,
                 child: SingleChildScrollView(

                   child: Padding(
                     padding: const EdgeInsets.all(20.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           'Login',
                           style: TextStyle(
                             fontSize: 30.0,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                         SizedBox(
                           height: 30.0,
                         ),
                         DefaultTextFormField(
                           hint: 'Email',
                           validate: (value){
                             if(value.isEmpty)
                             {
                               return 'Enter the Email';
                             }
                             return null;
                           },
                           prefixicon: Icon(Icons.email,color: Colors.white,),
                           controller: email
                           ,type: TextInputType.emailAddress,

                         ),
                         SizedBox(
                           height: 15.0,
                         ),
                         DefaultTextFormField(
                           suffixicon: cubit.isPassword ? Icons.visibility : Icons.visibility_off ,
                           sufOnPressed: (){
                                cubit.setVis();
                           },
                           onSubmitted: (value){

                             if(keysss.currentState.validate())
                               cubit.userLogin(context: context,email: email.text, password: pass.text);
                           },
                           isPassword: cubit.isPassword,
                           prefixicon: Icon(Icons.lock,color: Colors.white,),
                           controller: pass
                           ,type: TextInputType.emailAddress,
                           hint: 'password',
                           validate: (value){
                             if(value.isEmpty)
                             {
                               return 'Enter the Password';
                             }
                             return null;
                           },
                         ),
                         SizedBox(
                           height: 20.0,
                         ),
                         ConditionalBuilder(
                           condition: state is !LoginLoadingState,
                           builder:(context) =>  Container(
                             width: double.infinity,
                             height: 45.0,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(18.0)
                             ),
                             child: DefualtButton(

                                 fun: (){
                                   if(keysss.currentState.validate())
                                     cubit.userLogin(context: context,email: email.text, password: pass.text);
                                 },
                                 child: Text('LOGIN')
                             ),
                           ),
                           fallback:(context) => Center(child: CircularProgressIndicator(),) ,
                         ),
                         SizedBox(
                           height: 10.0,
                         ),
                         GoogleSignInButtom(),
                         SizedBox(
                           height: 20.0,
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text('Don\'t Have an Account?'),
                             TextButton(onPressed: (){
                               NavigateTo(context,RegisterScreen());
                             }, child: Text('Register Now'))

                           ],
                         ),
                       ],
                     ),
                   ),
                 ),
               ),
             ),
           );
         },
       ),
     );
   }
}



