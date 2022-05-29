import 'package:fitden_homeworkout/constants/colors.dart';
import 'package:fitden_homeworkout/constants/consts.dart';
import 'package:fitden_homeworkout/constants/icons.dart';
import 'package:fitden_homeworkout/controllers/basic_controller.dart';
import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:fitden_homeworkout/views/pages/authentication/forgot_pass/forgt_pass_page.dart';
import 'package:fitden_homeworkout/views/pages/authentication/sign_up/sign_up_page.dart';
import 'package:fitden_homeworkout/views/pages/user_info/user_age_page.dart';
import 'package:fitden_homeworkout/views/widgets/auth_button.dart';
import 'package:fitden_homeworkout/views/widgets/my_button.dart';
import 'package:fitden_homeworkout/views/widgets/my_inputfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  BasicController basicController = Get.put(BasicController());
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 13 * SizeConfig.widthMultiplier,
                vertical: 10 * SizeConfig.heightMultiplier),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(logo, height: 8 * SizeConfig.heightMultiplier),
                  SizedBox(height: 3 * SizeConfig.heightMultiplier),
                  Text('Hello',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: primaryColor, fontWeight: FontWeight.bold)),
                  Text("let's intoduce",
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.grey)),
                  MyInputField(
                      hintText: 'mail',
                      controller: emailController,
                      validator: (value) {
                        return '';
                        // if (value!.isEmpty || value == null) {
                        //   return 'required';
                        // } else if (GetUtils.isEmail(value)) {
                        //   return "Invalid Email";
                        // } else {
                        //   return null!;
                        // }
                      }),
                  SizedBox(height: 2 * SizeConfig.heightMultiplier),
                  MyInputField(
                    isObsure: true,
                    hintText: 'password',
                    controller: passwordController,
                    validator: (value) {
                      return '';
                      // if (value!.isEmpty || value == null) {
                      //   return "Required";
                      // } else if (value.length < 8) {
                      //   return "Password too short";
                      // } else {
                      //   return null!;
                      // }
                    },
                  ),
                  SizedBox(height: 6 * SizeConfig.heightMultiplier),
                  GestureDetector(
                    onTap: () {
                      inputValidation();
                      con.login(emailController.text, passwordController.text);
                    },
                    child: Container(
                      height: 7 * SizeConfig.heightMultiplier,
                      width: 80 * SizeConfig.widthMultiplier,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius),
                      ),
                      child: Center(
                          child: Text(
                        'Login',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      )),
                    ),
                  ),
                  SizedBox(height: 3 * SizeConfig.heightMultiplier),
                  SizedBox(height: 1 * SizeConfig.heightMultiplier),
                  Row(
                    children: [
                      Text("Didn't have an account? ",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(color: Colors.black)),
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
                  SizedBox(height: 1 * SizeConfig.heightMultiplier),
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void inputValidation() {
    if (formKey.currentState!.validate()) {
      print('not validate');
    } else {}
  }
}
