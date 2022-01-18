import 'package:Hayah_Clinic/modules/register_screen/cubit/register_cubit.dart';
import 'package:Hayah_Clinic/modules/register_screen/cubit/register_cubit_states.dart';
import 'package:Hayah_Clinic/shared/styles/colors.dart';
import 'package:Hayah_Clinic/shared/widgets/DefualtTextButton.dart';
import 'package:Hayah_Clinic/shared/widgets/TitleText.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/widgets/DefualtTextFormField.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController pass = TextEditingController();
  var keysss = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: keysss,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText('Register'),
                      const SizedBox(
                        height: 30.0,
                      ),
                      DefaultTextFormField(
                        hint: 'User Name',
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'User Name Must Not Be Empty';
                          }
                          return null;
                        },
                        prefixicon: Icon(Icons.person),
                        controller: name,
                        type: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      DefaultTextFormField(
                        hint: 'Email Address',
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Email Address Must Not Be Empty';
                          }
                          return null;
                        },
                        prefixicon: Icon(Icons.email),
                        controller: email,
                        type: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      DefaultTextFormField(
                        isPassword: cubit.isPassword,
                        suffixicon: cubit.isPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        sufOnPressed: () {
                          cubit.setVis();
                        },
                        prefixicon: Icon(Icons.lock),
                        controller: pass,
                        type: TextInputType.visiblePassword,
                        hint: 'password',
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'password Must Not Be Empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      DefaultTextFormField(
                        prefixicon: Icon(Icons.phone),
                        controller: phone,
                        type: TextInputType.phone,
                        hint: 'Phone',
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Phone Must Not Be Empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30.0,
                      ),


                      ConditionalBuilder(
                        condition: state is !RegisterLoadingState,
                        builder: (context) => DefaultButton(
                            color: defColor,
                            fun: () {
                              if (keysss.currentState.validate()) {
                                cubit.createUserRegister(
                                  name: name.text,
                                  phone: phone.text,
                                  email: email.text,
                                  password: pass.text,
                                  context: context,
                                );
                              }
                            },
                            child: Text('Register'.toUpperCase() ,style: Theme.of(context).textTheme.bodyText2,)),
                        fallback: (context) => Center(child: CircularProgressIndicator()),
                      ),
                    ],
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
