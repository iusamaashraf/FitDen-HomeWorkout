import 'dart:async';

import 'package:fitden_homeworkout/constants/images.dart';
import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:fitden_homeworkout/views/pages/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 6), () {
      Get.offAll(() => SignInPage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Column(
          children: [
            Container(
              height: 100 * SizeConfig.heightMultiplier,
              width: 100 * SizeConfig.widthMultiplier,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(splash),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Fit Den',
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  Text('Home Workout Assistant',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(height: 13 * SizeConfig.heightMultiplier),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
