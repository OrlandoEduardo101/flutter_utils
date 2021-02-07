import 'package:flutter/material.dart';
import 'package:nintendo_swt/core/components/containers/blue_red_container.dart';
import 'package:nintendo_swt/core/components/logos/big_logo.dart';
import 'package:nintendo_swt/core/components/screen/screen_widget.dart';

import '../core/colors/colors.dart';

class NintendoScreen extends StatefulWidget {
  @override
  _NintendoScreenState createState() => _NintendoScreenState();
}

class _NintendoScreenState extends State<NintendoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.bgScreenTop, AppColors.bgScreenBottom]),
        ),
        //padding: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: ScreenWidget(child: BigLogo()),
            ),
            BlueRedContainer(),
          ],
        ),
      ),
    );
  }
}
