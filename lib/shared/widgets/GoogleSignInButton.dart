import 'package:Hayah_Clinic/modules/loginscreen/cubit/login_cubit.dart';
import 'package:Hayah_Clinic/shared/widgets/DefualtTextButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleSignInButtom extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: DefualtButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(FontAwesomeIcons.google, color: Colors.red),
              SizedBox(width: 5.0,),
              Text(
                'Sign In With Google',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          fun: () {
          final cubit = LoginCubit.get(context);
          cubit.userGoogleLogin(context);
          },
        color: Colors.grey[300],
      )
    );
  }
}
