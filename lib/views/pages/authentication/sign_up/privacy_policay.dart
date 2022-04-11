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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Text('Types of Data Collected',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                Text("""
          Personal Data
          
          While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:
          
              ->Email address
          
              ->First name and last name
          
              ->Usage Data
          
          """,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.normal)),
                Text('Security of Your Personal Data',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                Text("""
          The security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security.
          
          """,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.normal)),
                Text('Contact Us',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                Text("""
          If you have any questions about this Privacy Policy, You can contact us:
          
              By email: prousamaa@gmail.com
          
          """,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.normal))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
