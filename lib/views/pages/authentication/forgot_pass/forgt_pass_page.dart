import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitden_homeworkout/constants/consts.dart';
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
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 100 * SizeConfig.heightMultiplier,
            width: 100 * SizeConfig.widthMultiplier,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 3 * SizeConfig.widthMultiplier),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Recover Password',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Wrap(
                          children: [
                            Text(
                              "Looks like you forgot your account.Let's recover account e.g",
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Colors.black,
                                      ),
                            ),
                            Text(
                              "jane.doe@gmail.com",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 1 * SizeConfig.heightMultiplier),
                        MyInputField(
                          controller: emailController,
                          hintText: 'Email',
                          //  labelText: 'Email',
                          validator: (val) {
                            return '';
                          },
                        ),
                        SizedBox(height: 1 * SizeConfig.heightMultiplier),
                        SizedBox(height: 1.5 * SizeConfig.heightMultiplier),
                        Mybutton(
                          onTap: () {
                            resetPassword();
                            Get.back();
                          },
                          text: "Continue",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future resetPassword() async {
    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (context) => const Center(child: CircularProgressIndicator()));
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      Get.snackbar('Reset', 'link sent to your email');
    } catch (e) {
      print(e.toString());
    }
  }
}
