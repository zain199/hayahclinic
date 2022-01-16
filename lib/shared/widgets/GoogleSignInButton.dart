import 'package:Hayah_Clinic/modules/loginscreen/cubit/login_cubit.dart';
import 'package:Hayah_Clinic/shared/widgets/DefualtTextButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleSignInButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: DefaultButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(FontAwesomeIcons.google ,color: Colors.red, ),
              SizedBox(width: 10.0,),
              Text(
                'Sign In With Google',
                style: Theme.of(context).textTheme.subtitle2,
              )
            ],
          ),

          fun: () {
          final cubit = LoginCubit.get(context);
          cubit.userGoogleLogin(context);
          },
        color: Colors.indigo,
      )
    );
  }
}
