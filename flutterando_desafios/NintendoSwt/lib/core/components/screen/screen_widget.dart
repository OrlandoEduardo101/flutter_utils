import 'package:flutter/material.dart';
import 'package:nintendo_swt/core/colors/colors.dart';

class ScreenWidget extends StatelessWidget {
  final Widget child;

  ScreenWidget({this.child});
  
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Container(
      height: 360.69 * (mq.height/667),
      width: 331.52 * (mq.width/375),
      decoration: BoxDecoration(
        color: AppColors.screen,
        borderRadius: BorderRadius.circular(10)
      ),
      child: child,
    );
  }
}