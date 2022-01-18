import 'package:Hayah_Clinic/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  double width = double.infinity;
  Color color = defColor;
  Widget child;
  Function fun;

  DefaultButton({
    this.width = double.infinity,
    this.color = defColor,
    @required this.child,
    @required this.fun,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: MaterialButton(
          height: 45.0,
          minWidth: width,
          color: color,
          child: child,
          onPressed: fun),
    );
  }
}
