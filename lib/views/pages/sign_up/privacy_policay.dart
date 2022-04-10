import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black)),
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Privacy Policy for FitDen Home Workout Assistant',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              SizedBox(height: 2 * SizeConfig.heightMultiplier),
              Text("""
Last updated: April 10, 2022

This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.

We use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. This Privacy Policy has been created with the help of the Privacy Policy Template.
""",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.normal)),
            ],
          ),
        ),
      ),
    );
  }
}
