import 'package:Hayah_Clinic/modules/loginscreen/cubit/login_cubit.dart';
import 'package:Hayah_Clinic/modules/loginscreen/cubit/login_cubit_states.dart';
import 'package:Hayah_Clinic/modules/register_screen/register_screen.dart';
import 'package:Hayah_Clinic/shared/methods.dart';
import 'package:Hayah_Clinic/shared/styles/colors.dart';
import 'package:Hayah_Clinic/shared/widgets/DefualtTextButton.dart';
import 'package:Hayah_Clinic/shared/widgets/DefualtTextFormField.dart';
import 'package:Hayah_Clinic/shared/widgets/GoogleSignInButton.dart';
import 'package:Hayah_Clinic/shared/widgets/TitleText.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final GlobalKey<FormState> keysss = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
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
                        TitleText("login"),
                        const SizedBox(
                          height: 30.0,
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
                        const SizedBox(
                          height: 15.0,
                        ),
                        DefaultTextFormField(
                          suffixicon: cubit.isPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          sufOnPressed: () {
                            cubit.setVis();
                          },
                          onSubmitted: (value) {
                            if (keysss.currentState.validate())
                              cubit.userLogin(
                                  context: context,
                                  email: email.text,
                                  password: pass.text);
                          },
                          isPassword: cubit.isPassword,
                          prefixicon: Icon(Icons.lock),
                          controller: pass,
                          type: TextInputType.visiblePassword,
                          hint: 'Password',
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Password Must Not Be Empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context) => Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18.0)),
                            child: DefaultButton(
                                fun: () {
                                  if (keysss.currentState.validate())
                                    cubit.userLogin(
                                        context: context,
                                        email: email.text,
                                        password: pass.text);
                                },
                                child: Text(
                                  'LOGIN',
                                  style: Theme.of(context).textTheme.bodyText2,
                                )),
                          ),
                          fallback: (context) => Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        GoogleSignInButton(),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t Have an Account?',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            TextButton(
                                onPressed: () {
                                  NavigateTo(context, RegisterScreen());
                                },
                                child: Text(
                                  'Register Now',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                        color: defColor,
                                      ),
                                ))
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
