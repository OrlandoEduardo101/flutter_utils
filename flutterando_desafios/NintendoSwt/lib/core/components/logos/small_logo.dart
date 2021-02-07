import 'package:flutter/material.dart';
import 'package:nintendo_swt/core/colors/colors.dart';

class SmallLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Container(
      width: 100 * (mq.width/375),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
             height: 45 * (mq.width/375),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                      child: Container(
                        height: 6 * (mq.width/375),
                        width: 6 * (mq.width/375),
                        decoration: BoxDecoration(
                        color: AppColors.lampOn,
                        shape: BoxShape.circle
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 6 * (mq.width/375),
                        width: 6 * (mq.width/375),
                        decoration: BoxDecoration(
                        color: AppColors.lampOff,
                        shape: BoxShape.circle
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 6 * (mq.width/375),
                        width: 6 * (mq.width/375),
                        decoration: BoxDecoration(
                        color: AppColors.lampOff,
                        shape: BoxShape.circle
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 6 * (mq.width/375),
                        width: 6 * (mq.width/375),
                        decoration: BoxDecoration(
                        color: AppColors.lampOff,
                        shape: BoxShape.circle
                        ),
                      ),
                    ),
              ],
            ),
          ),
          Container(
            height: 50 * (mq.height/667),
            width: 47 * (mq.width/375),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 46.98 * (mq.height/667),
                  width: 22.7 * (mq.width/375),
                  decoration: BoxDecoration(
                    color: AppColors.smallLogo,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    )
                  ),
                  child: Center(
                    child: Container(
                  height: 38 * (mq.height/667),
                  width: 15 * (mq.width/375),
                  decoration: BoxDecoration(
                    color: Color(0xff2e3135),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                       height: 8 * (mq.height/667),
                      ),
                      Center(
                        child: Container(
                          height: 8.79 * (mq.width/375),
                          width: 8.79 * (mq.width/375),
                          decoration: BoxDecoration(
                          color: AppColors.smallLogo,
                          shape: BoxShape.circle
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                  ),
                ),
                //SizedBox(width: 12.48 * (mq.width/375),),
                Container(
                  height: 46.98 * (mq.height/667),
                  width: 22.7 * (mq.width/375),
                  decoration: BoxDecoration(
                    color: AppColors.smallLogo,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    )
                  ),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                     height: 20 * (mq.height/667),
                    ),
                    Center(
                      child: Container(
                        height: 11 * (mq.width/375),
                        width: 11 * (mq.width/375),
                        decoration: BoxDecoration(
                        color: Color(0xff2e3135),
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
          SizedBox(
             height: 45 * (mq.width/375),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                      child: Container(
                        height: 6 * (mq.width/375),
                        width: 6 * (mq.width/375),
                        decoration: BoxDecoration(
                        color: AppColors.lampOff,
                        shape: BoxShape.circle
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 6 * (mq.width/375),
                        width: 6 * (mq.width/375),
                        decoration: BoxDecoration(
                        color: AppColors.lampOff,
                        shape: BoxShape.circle
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 6 * (mq.width/375),
                        width: 6 * (mq.width/375),
                        decoration: BoxDecoration(
                        color: AppColors.lampOff,
                        shape: BoxShape.circle
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 6 * (mq.width/375),
                        width: 6 * (mq.width/375),
                        decoration: BoxDecoration(
                        color: AppColors.lampOff,
                        shape: BoxShape.circle
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}