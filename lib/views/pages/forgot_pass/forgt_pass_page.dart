import 'dart:ui';

import 'package:fitden_homeworkout/constants/colors.dart';
import 'package:fitden_homeworkout/constants/consts.dart';
import 'package:fitden_homeworkout/constants/images.dart';
import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:fitden_homeworkout/views/widgets/my_button.dart';
import 'package:fitden_homeworkout/views/widgets/my_inputfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassPage extends StatelessWidget {
  ForgotPassPage({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Column(
          children: [
            Container(
              height: 100 * SizeConfig.heightMultiplier,
              width: 100 * SizeConfig.widthMultiplier,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(authImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(bottom: 2 * SizeConfig.heightMultiplier),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10 * SizeConfig.widthMultiplier,
                            bottom: 3 * SizeConfig.heightMultiplier),
                        child: Text('Recover Password',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(defaultBorderRadius),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                        child: Container(
                          width: 90 * SizeConfig.widthMultiplier,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius),
                            border: Border.all(
                                color: Colors.black.withOpacity(0.05)),
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.2),
                                // const Color(0xff2E2B2C),
                                Colors.black.withOpacity(0.08),
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Wrap(
                                  children: [
                                    Text(
                                      "Looks like you forgot your account.Let's recover account e.g",
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                    Text(
                                      "jane.doe@gmail.com",
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: 1 * SizeConfig.heightMultiplier),
                                MyInputField(
                                  controller: emailController,
                                  hintText: 'Email',
                                  //  labelText: 'Email',
                                  validator: (val) {
                                    return '';
                                  },
                                ),
                                SizedBox(
                                    height: 1 * SizeConfig.heightMultiplier),
                                SizedBox(
                                    height: 1.5 * SizeConfig.heightMultiplier),
                                Mybutton(
                                  onTap: () {},
                                  text: "Continue",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
