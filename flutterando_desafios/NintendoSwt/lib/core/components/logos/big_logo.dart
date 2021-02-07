import 'package:flutter/material.dart';
import 'package:nintendo_swt/core/colors/colors.dart';

class BigLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: 129.15 * (mq.height/667),
        width: 137.62 * (mq.width/375),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 129.04 * (mq.height/667),
              width: 62.38 * (mq.width/375),
              decoration: BoxDecoration(
                color: AppColors.bigLogo,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                )
              ),
              child: Center(
                child: Container(
              height: 110 * (mq.height/667),
              width: 42 * (mq.width/375),
              decoration: BoxDecoration(
                color: AppColors.screen,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                   height: 15 * (mq.height/667),
                  ),
                  Center(
                    child: Container(
                      height: 24.15 * (mq.width/375),
                      width: 24.15 * (mq.width/375),
                      decoration: BoxDecoration(
                      color: AppColors.bigLogo,
                      shape: BoxShape.circle
                      ),
                    ),
                  ),
                ],
              ),
            ),
              ),
            ),
            SizedBox(width: 12.48 * (mq.width/375),),
            Container(
              height: 129.04 * (mq.height/667),
              width: 62.38 * (mq.width/375),
              decoration: BoxDecoration(
                color: AppColors.bigLogo,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                )
              ),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                 height: 65 * (mq.height/667),
                ),
                Center(
                  child: Container(
                    height: 28 * (mq.width/375),
                    width: 28 * (mq.width/375),
                    decoration: BoxDecoration(
                    color: AppColors.screen,
                    shape: BoxShape.circle
                    ),
                  ),
                ),
              ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}