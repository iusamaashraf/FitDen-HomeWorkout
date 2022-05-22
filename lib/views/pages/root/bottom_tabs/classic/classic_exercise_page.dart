import 'package:fitden_homeworkout/constants/colors.dart';
import 'package:fitden_homeworkout/constants/consts.dart';
import 'package:fitden_homeworkout/constants/images.dart';
import 'package:fitden_homeworkout/models/classic_model.dart';
import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:fitden_homeworkout/models/start_exercise_model.dart';
import 'package:fitden_homeworkout/views/pages/rest_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:readmore/readmore.dart';

// ignore: must_be_immutable
class ClassicExercisePage extends StatelessWidget {
  ClassicExercisePage({
    Key? key,
    required this.getData,
  }) : super(key: key);
  final Classic getData;
  final FlutterTts flutterTts = FlutterTts();
  speak(String name) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: primaryColor,
            expandedHeight: 200,
            floating: true,
            pinned: true,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.adaptive.arrow_back),
            ),
            // title: const Text('Today Exercieses'),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                exerciseHeaderImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          buildImages(context),
        ],
      ),
    );
  }

  buildImages(BuildContext context) => SliverToBoxAdapter(
        child: SizedBox(
            height: 100 * SizeConfig.heightMultiplier,
            width: 100 * SizeConfig.widthMultiplier,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 4 * SizeConfig.widthMultiplier,
                  vertical: 5 * SizeConfig.heightMultiplier),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReadMoreText(
                    "Just 5 - 10 min, this training is designed especially for beginners who want to looks good but don't know where to start.\n\nThis training mixes with basic aerobic and anaerobic exercises. It uses your bodyweight to work all muscles groups and boost your fat burning.\n\nLow impact option is friendlu for people who are overweight or have joint problems. Please stick to a low calorie diet to maximize your workout result.",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Colors.black),
                    trimLines: 2,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'More',
                    trimExpandedText: 'Less',
                    lessStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                    moreStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 2 * SizeConfig.heightMultiplier),
                  Container(
                      // height: 10 * SizeConfig.heightMultiplier,
                      width: 100 * SizeConfig.widthMultiplier,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(defaultBorderRadius),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 18)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            ColumnData(
                              description: 'Begginer',
                              heading: 'Level',
                            ),
                            ColumnData(
                              description: '10 Mins.',
                              heading: 'Time',
                            ),
                          ],
                        ),
                      )),
                  SizedBox(height: 2 * SizeConfig.heightMultiplier),
                  Text("Today's " + getData.totalExercises.toString()),
                  SizedBox(height: 2 * SizeConfig.heightMultiplier),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: myPlan.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  showBarModalBottomSheet(
                                    context: context,
                                    builder: (context) => SizedBox(
                                      height: 80 * SizeConfig.heightMultiplier,
                                      width: 100 * SizeConfig.widthMultiplier,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 20 *
                                                  SizeConfig.heightMultiplier,
                                              width: 100 *
                                                  SizeConfig.widthMultiplier,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        defaultBorderRadius),
                                                color: Colors.grey[300],
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        myPlan[index].imgPath!),
                                                    fit: BoxFit.cover),
                                                boxShadow: const [
                                                  BoxShadow(
                                                      color: Colors.black12,
                                                      blurRadius: 6)
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                                height: 2 *
                                                    SizeConfig
                                                        .heightMultiplier),
                                            Text(myPlan[index].exerciseNmae!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6!
                                                    .copyWith(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            SizedBox(
                                                height: 2 *
                                                    SizeConfig
                                                        .heightMultiplier),
                                            Text(myPlan[index].duration!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline3!
                                                    .copyWith(
                                                        color: primaryColor,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            SizedBox(
                                                height: 2 *
                                                    SizeConfig
                                                        .heightMultiplier),
                                            Text('Here is the description',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline3!
                                                    .copyWith(
                                                        color: primaryColor,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            GestureDetector(
                                              onTap: () {
                                                // speak(myPlan[index]
                                                //     .exerciseNmae!);
                                                Get.back();
                                                Get.to(() => const RestPage());
                                              },
                                              child: Container(
                                                height: 15 *
                                                    SizeConfig.heightMultiplier,
                                                width: 15 *
                                                    SizeConfig.widthMultiplier,
                                                decoration: const BoxDecoration(
                                                  color: primaryColor,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: const Icon(Icons.done,
                                                    color: Colors.white),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height: 8 * SizeConfig.heightMultiplier,
                                      width: 20 * SizeConfig.widthMultiplier,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[50],
                                          borderRadius: BorderRadius.circular(
                                              defaultBorderRadius)),
                                      child: Image.asset(
                                        myPlan[index].imgPath!,
                                      ),
                                    ),
                                    SizedBox(
                                        width: 3 * SizeConfig.widthMultiplier),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width:
                                              50 * SizeConfig.widthMultiplier,
                                          child: Text(
                                              myPlan[index].exerciseNmae!,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1!
                                                  .copyWith(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                        ),
                                        Text(myPlan[index].duration!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(color: Colors.grey))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            )),
      );
}

class ColumnData extends StatelessWidget {
  const ColumnData({
    Key? key,
    required this.description,
    required this.heading,
  }) : super(key: key);
  final String heading, description;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(description,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
        Text(heading,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.grey)),
      ],
    );
  }
}
