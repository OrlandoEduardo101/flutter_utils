import 'package:flutter/material.dart';
import 'package:nintendo_swt/core/colors/colors.dart';

class BigButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: 57 * (mq.width/375),
        width: 57 * (mq.width/375),
        decoration: BoxDecoration(
          color: AppColors.bigButtonLayerBorder,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.bigButtonLayerBorder
          ),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.bigButtonLayer2Top, AppColors.bigButtonLayer2Botto]),
        ),
        child: Center(
      child: Container(
        height: 43 * (mq.width/375),
        width: 43 * (mq.width/375),
        decoration: BoxDecoration(
          color: AppColors.bigButtonLayerBorder,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.bigButtonLayerBorder
          ),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.bigButtonLayer2Top, AppColors.bigButtonLayer2Botto]),
        ),
      ),
    ),
      ),
    );
  }
}