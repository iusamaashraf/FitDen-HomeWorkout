import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitden_homeworkout/constants/colors.dart';
import 'package:fitden_homeworkout/constants/consts.dart';
import 'package:fitden_homeworkout/constants/images.dart';
import 'package:fitden_homeworkout/controllers/user_controller.dart';
import 'package:fitden_homeworkout/models/classic_list.dart';
import 'package:fitden_homeworkout/models/classic_model.dart';
import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:fitden_homeworkout/models/start_exercise_model.dart';
import 'package:fitden_homeworkout/views/pages/rest_page.dart';
import 'package:fitden_homeworkout/views/pages/root/bottom_tabs/classic/start_exercise_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:readmore/readmore.dart';

// ignore: must_be_immutable
class ClassicExercisePage extends StatefulWidget {
  const ClassicExercisePage({
    Key? key,
    required this.getData,
    required this.dayWiseExerciseModel,
    required this.docId,
  }) : super(key: key);
  final Classic getData;
  final DayWiseExerciseModel dayWiseExerciseModel;
  final String docId;

  @override
  State<ClassicExercisePage> createState() => _ClassicExercisePageState();
}

class _ClassicExercisePageState extends State<ClassicExercisePage> {
  final FlutterTts flutterTts = FlutterTts();
  UserController userController = Get.put(UserController());

  @override
  void initState() {
    FirebaseFirestore.instance
        .collection('user')
        .doc(userController.auth.currentUser?.uid)
        .collection('daywiseExercises')
        .doc(widget.docId)
        .update({
      'isStart': true,
    }).then((value) {
      print('data update');
    });
    userController.allExerciseStream(widget.docId);
    super.initState();
  }

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
                    widget.dayWiseExerciseModel.description!,
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
                  Text("Today's " + widget.getData.totalExercises.toString()),
                  SizedBox(height: 2 * SizeConfig.heightMultiplier),
                  Expanded(
                    child: GetX<UserController>(
                        init: Get.put(UserController()),
                        builder: (userController) {
                          return ListView.builder(
                            padding: EdgeInsets.only(
                                bottom: 3 * SizeConfig.heightMultiplier),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: userController.getallExercise.length,
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
                                            height: 80 *
                                                SizeConfig.heightMultiplier,
                                            width: 100 *
                                                SizeConfig.widthMultiplier,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 20 *
                                                        SizeConfig
                                                            .heightMultiplier,
                                                    width: 100 *
                                                        SizeConfig
                                                            .widthMultiplier,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              defaultBorderRadius),
                                                      color: Colors.grey[300],
                                                      image: DecorationImage(
                                                          image: AssetImage(userController
                                                                      .getallExercise[
                                                                          index]
                                                                      .image! ==
                                                                  null
                                                              ? 'assets/animations/01281201-Battling-Ropes.gif'
                                                              : userController
                                                                  .getallExercise[
                                                                      index]
                                                                  .image!),
                                                          fit: BoxFit.cover),
                                                      boxShadow: const [
                                                        BoxShadow(
                                                            color:
                                                                Colors.black12,
                                                            blurRadius: 6)
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height: 2 *
                                                          SizeConfig
                                                              .heightMultiplier),
                                                  Text(
                                                      userController
                                                          .getallExercise[index]
                                                          .title!,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6!
                                                          .copyWith(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                  SizedBox(
                                                      height: 2 *
                                                          SizeConfig
                                                              .heightMultiplier),
                                                  Text(
                                                      userController
                                                          .getallExercise[index]
                                                          .noOfSets
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline3!
                                                          .copyWith(
                                                              color:
                                                                  primaryColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                  SizedBox(
                                                      height: 2 *
                                                          SizeConfig
                                                              .heightMultiplier),
                                                  Flexible(
                                                    child: Text(
                                                        userController
                                                            .getallExercise[
                                                                index]
                                                            .description!,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle1!
                                                            .copyWith(
                                                                color:
                                                                    primaryColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          Get.to(() =>
                                                              const RestPage());
                                                        },
                                                        child: const Icon(
                                                            Icons.done,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      SizedBox(
                                                        width: 4 *
                                                            SizeConfig
                                                                .widthMultiplier,
                                                      ),
                                                      Container(
                                                        height: 12 *
                                                            SizeConfig
                                                                .heightMultiplier,
                                                        width: 12 *
                                                            SizeConfig
                                                                .widthMultiplier,
                                                        decoration:
                                                            const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color:
                                                                    primaryColor),
                                                        child: Center(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              speak(userController
                                                                  .getallExercise[
                                                                      index]
                                                                  .description!);
                                                            },
                                                            child: const Icon(
                                                                Icons.mic,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Container(
                                            height:
                                                8 * SizeConfig.heightMultiplier,
                                            width:
                                                20 * SizeConfig.widthMultiplier,
                                            decoration: BoxDecoration(
                                                color: Colors.grey[50],
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        defaultBorderRadius)),
                                            child: Image.asset(
                                              userController
                                                  .getallExercise[index].image!,
                                            ),
                                          ),
                                          SizedBox(
                                              width: 3 *
                                                  SizeConfig.widthMultiplier),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 50 *
                                                    SizeConfig.widthMultiplier,
                                                child: Text(
                                                    userController
                                                        .getallExercise[index]
                                                        .title!,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .subtitle1!
                                                        .copyWith(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                              ),
                                              Text(
                                                  userController
                                                      .getallExercise[index]
                                                      .noOfSets
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                          color: Colors.grey))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // userController.getallExercise.length - 1 ==
                                  //         index
                                  //     ? TextButton(
                                  //         onPressed: () {},
                                  //         child: const Text('Start',
                                  //             style: TextStyle(
                                  //                 fontSize: 24,
                                  //                 color: Colors.black)))
                                  //     : TextButton(
                                  //         onPressed: () {
                                  //           Get.to(() => StartExercisePage(
                                  //               getData: userController
                                  //                   .getallExercise[index]));
                                  //         },
                                  //         child: const Text('Start',
                                  //             style: TextStyle(
                                  //                 color: Colors.black))),
                                ],
                              );
                            },
                          );
                        }),
                  ),
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
