import 'dart:ui';

import 'package:fitden_homeworkout/constants/colors.dart';
import 'package:fitden_homeworkout/constants/consts.dart';
import 'package:fitden_homeworkout/constants/icons.dart';
import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:fitden_homeworkout/views/pages/authentication/forgot_pass/forgt_pass_page.dart';
import 'package:fitden_homeworkout/views/pages/authentication/sign_up/sign_up_page.dart';
import 'package:fitden_homeworkout/views/pages/root/root_page.dart';
import 'package:fitden_homeworkout/views/widgets/auth_button.dart';
import 'package:fitden_homeworkout/views/widgets/my_button.dart';
import 'package:fitden_homeworkout/views/widgets/my_inputfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100 * SizeConfig.heightMultiplier,
                width: 100 * SizeConfig.widthMultiplier,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/login.jpg'),
                    fit: BoxFit.fitHeight,
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
                          child: Text('Log in',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                        ),
                      ),
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius),
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
                                  MyInputField(
                                    controller: emailController,
                                    hintText: 'Email',
                                    //labelText: 'Email',
                                    validator: (val) {
                                      return '';
                                    },
                                  ),
                                  SizedBox(
                                      height:
                                          1.5 * SizeConfig.heightMultiplier),
                                  MyInputField(
                                    isObsure: true,
                                    controller: passwordController,
                                    hintText: 'Password',
                                    // labelText: 'Password',
                                    validator: (val) {
                                      return '';
                                    },
                                  ),
                                  SizedBox(
                                      height:
                                          1.5 * SizeConfig.heightMultiplier),
                                  Mybutton(
                                    onTap: () {
                                      Get.offAll(const RootPage());
                                    },
                                    text: "Continue",
                                  ),
                                  SizedBox(
                                      height: 1 * SizeConfig.heightMultiplier),
                                  Text(
                                    'or',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                  SizedBox(
                                      height: 1 * SizeConfig.heightMultiplier),
                                  AuthButton(
                                    onTap: () {},
                                    text: 'Continue with Facebook',
                                    icon: fb,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                      height: 1 * SizeConfig.heightMultiplier),
                                  AuthButton(
                                    onTap: () {},
                                    text: 'Continue with Google',
                                    icon: google,
                                    color: primaryColor,
                                  ),
                                  SizedBox(
                                      height: 1 * SizeConfig.heightMultiplier),
                                  Row(
                                    children: [
                                      Text("Didn't have an account? ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2!
                                              .copyWith(color: Colors.white)),
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(() => SignUpPage());
                                        },
                                        child: Text("Sign up",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(color: primaryColor)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      height: 1 * SizeConfig.heightMultiplier),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(
                                          () => ForgotPassPage(),
                                        );
                                      },
                                      child: Text("Forgot your password?",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2!
                                              .copyWith(color: primaryColor)),
                                    ),
                                  )
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
      ),
    );
  }
}
