import 'package:flutter/material.dart';
import 'package:nintendo_swt/core/colors/colors.dart';
import 'package:nintendo_swt/core/components/buttons/big_button.dart';
import 'package:nintendo_swt/core/components/buttons/small_button.dart';
import 'package:nintendo_swt/core/components/logos/small_logo.dart';
import 'dart:math' as math;

class BlueRedContainer extends StatelessWidget {
  const BlueRedContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 257.38 * (mq.height / 667),
            width: 123.19 * (mq.width / 375),
            decoration: BoxDecoration(
              color: AppColors.leftSide,
              borderRadius: BorderRadius.only(topRight: Radius.circular(100)),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    top: 15 * (mq.height / 667),
                    left: 15 * (mq.width / 375),
                    child: Container(
                      height: 6 * (mq.height / 667),
                      width: 20 * (mq.width / 375),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.minusButtomTop,
                              AppColors.minusButtomBottom
                            ]),
                      ),
                    )),
                Positioned(
                    top: 52 * (mq.height / 667), child: BigButtonWidget()),
                Positioned(
                    top: 118 * (mq.height / 667),
                    child: Container(
                      height: 86 * (mq.height / 667),
                      width: 86 * (mq.width / 375),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallButton(
                            child: Transform.rotate(
                                angle: -math.pi / 2,
                                child: Icon(
                                  Icons.play_arrow,
                                  color: AppColors.screen,
                                )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmallButton(
                                child: Transform.rotate(
                                    angle: -math.pi,
                                    child: Icon(
                                      Icons.play_arrow,
                                      color: AppColors.screen,
                                    )),
                              ),
                              SmallButton(
                                child: Transform.rotate(
                                    angle: 0,
                                    child: Icon(
                                      Icons.play_arrow,
                                      color: AppColors.screen,
                                    )),
                              ),
                            ],
                          ),
                          SmallButton(
                            child: Transform.rotate(
                                angle: -3 * math.pi / 2,
                                child: Icon(
                                  Icons.play_arrow,
                                  color: AppColors.screen,
                                )),
                          ),
                        ],
                      ),
                    )),
                Positioned(
                    bottom: 15 * (mq.height / 667),
                    left: 15 * (mq.width / 375),
                    child: Container(
                      height: 29 * (mq.height / 667),
                      width: 29 * (mq.width / 375),
                      decoration: BoxDecoration(
                        //shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppColors.homeLayer0Border,
                          width: 0.5,
                        ),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.soundLayer0Top,
                              AppColors.soundLayer0Bottom
                            ]),
                      ),
                      child: Center(
                        child: Container(
                          height: 22 * (mq.height / 667),
                          width: 22 * (mq.width / 375),
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: AppColors.homeLayer1Border,
                              width: 0.5,
                            ),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  AppColors.soundLayer1Top,
                                  AppColors.soundLayer1Bottom
                                ]),
                          ),
                          child: Center(
                            child: Container(
                              height: 15 * (mq.height / 667),
                              width: 15 * (mq.width / 375),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                //borderRadius: BorderRadius.circular(5),
                                color: AppColors.screen,
                                border: Border.all(
                                  color: AppColors.screen,
                                  width: 0.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
          SmallLogo(),
          Container(
            height: 257.38 * (mq.height / 667),
            width: 123.19 * (mq.width / 375),
            decoration: BoxDecoration(
              color: AppColors.rightSide,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    top: 15 * (mq.height / 667),
                    right: 15 * (mq.width / 375),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 20 * (mq.height / 667),
                          width: 6 * (mq.width / 375),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  AppColors.plusButtomTop,
                                  AppColors.plusButtomBottom
                                ]),
                          ),
                        ),
                        Container(
                          height: 6 * (mq.height / 667),
                          width: 20 * (mq.width / 375),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  AppColors.plusButtomTop,
                                  AppColors.plusButtomBottom
                                ]),
                          ),
                        ),
                      ],
                    )),
                Positioned(
                    bottom: 75 * (mq.height / 667), child: BigButtonWidget()),
                Positioned(
                    top: 32 * (mq.height / 667),
                    child: Container(
                      height: 86 * (mq.height / 667),
                      width: 86 * (mq.width / 375),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallButton(
                            child: Center(
                              child: Text(
                                'X',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmallButton(
                                child: Center(
                              child: Text(
                                'Y',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                              ),
                              SmallButton(
                                child: Center(
                              child: Text(
                                'A',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                              ),
                            ],
                          ),
                          SmallButton(
                            child: Center(
                              child: Text(
                                'B',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                Positioned(
                    bottom: 15 * (mq.height / 667),
                    right: 15 * (mq.width / 375),
                    child: Container(
                      height: 29 * (mq.height / 667),
                      width: 29 * (mq.width / 375),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.homeLayer0Border,
                          width: 0.5,
                        ),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.homeLayer0Top,
                              AppColors.homeLayer0Top
                            ]),
                      ),
                      child: Center(
                        child: Container(
                          height: 20 * (mq.height / 667),
                          width: 20 * (mq.width / 375),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.homeLayer1Border,
                              width: 0.5,
                            ),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  AppColors.homeLayer1Top,
                                  AppColors.homeLayer1Top
                                ]),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.home,
                              color: AppColors.screen,
                              size: 13,
                            ),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
