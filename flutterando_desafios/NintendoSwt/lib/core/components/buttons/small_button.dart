import 'package:flutter/material.dart';
import 'package:nintendo_swt/core/colors/colors.dart';

class SmallButton extends StatelessWidget {
  final Widget child;

  const SmallButton({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Container(
      height: 28 * (mq.width / 375),
      width: 28 * (mq.width / 375),
      decoration: BoxDecoration(
        color: AppColors.bigButtonLayerBorder,
        shape: BoxShape.circle,
        border: Border.all(width: 0.5, color: AppColors.bigButtonLayerBorder),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.bigButtonLayer2Top,
              AppColors.bigButtonLayer2Botto
            ]),
      ),
      child: Container(
        height: 20 * (mq.width / 375),
        width: 20 * (mq.width / 375),
        decoration: BoxDecoration(
          color: AppColors.bigButtonLayerBorder,
          shape: BoxShape.circle,
          border: Border.all(width: 0.5, color: AppColors.bigButtonLayerBorder),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.bigButtonLayer2Top,
                AppColors.bigButtonLayer2Botto
              ]),
        ),
        child: child,
      ),
    );
  }
}
