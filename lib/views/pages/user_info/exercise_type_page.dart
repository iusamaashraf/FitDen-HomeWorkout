import 'dart:ui';
import 'package:fitden_homeworkout/constants/consts.dart';
import 'package:fitden_homeworkout/main.dart';
import 'package:fitden_homeworkout/models/exercise_category_model.dart';
import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:fitden_homeworkout/views/pages/root/root_page.dart';
import 'package:fitden_homeworkout/views/pages/user_info/user_age_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ExerciseTypePage extends StatefulWidget {
  ExerciseTypePage({
    Key? key,
    required this.age,
    required this.height,
    required this.weight,
  }) : super(key: key);
  String age;
  String height;
  String weight;
  @override
  State<ExerciseTypePage> createState() => _ExerciseTypePageState();
}

class _ExerciseTypePageState extends State<ExerciseTypePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox.expand(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(microseconds: 500),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      exerciseCategoryImageData[_currentIndex].imgPath,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 15,
                    sigmaY: 15,
                  ),
                  child: Container(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
              ),
            ),
            FractionallySizedBox(
              heightFactor: 0.55,
              child: PageView.builder(
                scrollBehavior: MyBehavior(),
                onPageChanged: (int page) {
                  setState(() {
                    _currentIndex = page;
                  });
                },
                itemCount: exerciseCategoryImageData.length,
                itemBuilder: (BuildContext context, int index) {
                  return FractionallySizedBox(
                    widthFactor: 0.8,
                    child: GestureDetector(
                      onTap: () {
                        con.updateUserDetail(
                            widget.age,
                            widget.height,
                            widget.weight,
                            exerciseCategoryImageData[index].exerciseName);
                        // ignore: avoid_print
                        print(exerciseCategoryImageData[index].exerciseName);

                        Get.to(() => const RootPage());
                      },
                      child: Container(
                        margin: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            // color: Colors.red,
                            image: DecorationImage(
                              image: AssetImage(
                                exerciseCategoryImageData[index].imgPath,
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ]),
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: 5 * SizeConfig.heightMultiplier,
              child: Text(
                'WHAT MOTIVATES YOU TO \nEXERCISE?',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              bottom: 5 * SizeConfig.heightMultiplier,
              child: Column(
                children: [
                  Text(
                    'Exercise Type',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    exerciseCategoryImageData[_currentIndex].exerciseName,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
