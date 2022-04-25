import 'package:fitden_homeworkout/constants/colors.dart';
import 'package:fitden_homeworkout/constants/images.dart';
import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/about_text.dart';
import 'components/hard_element_text.dart';
import 'exercise_type_page.dart';

class ExperianceLvelPage extends StatelessWidget {
  const ExperianceLvelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Column(
          children: [
            Container(
              height: 100 * SizeConfig.heightMultiplier,
              width: SizeConfig.widthMultiplier * 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(experiancelevelimage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                height: 100 * SizeConfig.heightMultiplier,
                width: 100 * SizeConfig.widthMultiplier,
                color: primaryColor.withOpacity(0.8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HardElementText(),
                    const Spacer(),
                    const AboutText(),
                    SizedBox(
                      // height: 40 * SizeConfig.heightMultiplier,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            selectLevel(
                              'Inactive',
                              'I have never trained',
                              context,
                            ),
                            selectLevel(
                              'Begginer',
                              'Begginer Level',
                              context,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget selectLevel(String level, String description, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          Get.to(() => const ExerciseTypePage());
        },
        child: Container(
          margin: const EdgeInsets.all(8),
          height: 25 * SizeConfig.heightMultiplier,
          width: 50 * SizeConfig.widthMultiplier,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "I am",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(right: 8),
                        height: 7 * SizeConfig.heightMultiplier,
                        width: SizeConfig.widthMultiplier * 7,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                            child: Icon(
                          Icons.done,
                          color: primaryColor,
                        ))),
                  ],
                ),
                Text(
                  level,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  description,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
