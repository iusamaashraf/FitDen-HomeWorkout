import 'dart:async';

import 'package:fitden_homeworkout/constants/colors.dart';
 import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:fitden_homeworkout/views/pages/authentication/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Get.offAll(() => SignInPage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Fit Den',
                style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Text('Workout Assistant',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.white, fontWeight: FontWeight.normal)),
            SizedBox(height: 5 * SizeConfig.heightMultiplier),
            const SpinKitDoubleBounce(
              color: splashColor,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
