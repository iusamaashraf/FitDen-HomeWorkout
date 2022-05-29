import 'package:fitden_homeworkout/constants/colors.dart';
import 'package:fitden_homeworkout/constants/icons.dart';
import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:fitden_homeworkout/views/pages/user_info/user_age_page.dart';
import 'package:fitden_homeworkout/views/widgets/my_button.dart';
import 'package:fitden_homeworkout/views/widgets/my_inputfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(logo, height: 8 * SizeConfig.heightMultiplier),
                SizedBox(height: 3 * SizeConfig.heightMultiplier),
                Text('Sign up',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: primaryColor, fontWeight: FontWeight.bold)),
                Text("to start working",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.grey)),
                MyInputField(
                    hintText: 'username',
                    controller: usernameController,
                    validator: (val) {
                      return '';
                    }),
                SizedBox(height: 2 * SizeConfig.heightMultiplier),
                MyInputField(
                    hintText: 'email',
                    controller: emailController,
                    validator: (val) {
                      return '';
                    }),
                SizedBox(height: 2 * SizeConfig.heightMultiplier),
                MyInputField(
                    isObsure: true,
                    hintText: 'password',
                    controller: passwordController,
                    validator: (val) {
                      return '';
                    }),
                SizedBox(height: 6 * SizeConfig.heightMultiplier),
                Mybutton(
                    onTap: () {
                      con.signup(
                          age: '',
                          height: '',
                          weight: '',
                          exerciseType: '',
                          username: usernameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          image: '',exercisetypeid: '');
                    },
                    text: 'Sign up'),
                SizedBox(height: 3 * SizeConfig.heightMultiplier),
                SizedBox(height: 1 * SizeConfig.heightMultiplier),
                Row(
                  children: [
                    Text("Already have an account? ",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: Colors.black)),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Text("Sign in",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(color: primaryColor)),
                    ),
                  ],
                ),
                SizedBox(height: 1 * SizeConfig.heightMultiplier),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
