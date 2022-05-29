import 'package:fitden_homeworkout/constants/colors.dart';
import 'package:fitden_homeworkout/constants/consts.dart';
import 'package:fitden_homeworkout/controllers/user_controller.dart';
import 'package:fitden_homeworkout/models/classic_model.dart';
import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:fitden_homeworkout/views/pages/root/bottom_tabs/classic/classic_exercise_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ClassicPage extends StatefulWidget {
  const ClassicPage({Key? key}) : super(key: key);

  @override
  State<ClassicPage> createState() => _ClassicPageState();
}

class _ClassicPageState extends State<ClassicPage> {
  UserController con = Get.put(UserController());
  // UserController exerciseController = Get.put(UserController());
  int selectedIndex = 0;
  @override
  void initState() {
    con.dayWiseStream();
    print(con.getuser.exerciseType);
    // exerciseController.dayWiseStreamlogin(
    //     con.getuser.exerciseType!, con.getuser.exercisetypeid!);

    super.initState();
  }

  final FlutterTts flutterTts = FlutterTts();

  speak(String name) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(name);
  }

  @override
  Widget build(BuildContext context) {
    //  exerciseController.dayWiseStream();
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('MMM d, yyyy');
    final String formatted = formatter.format(now);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(formatted),
              const SizedBox(height: 10),
              Text('Home Workout',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              Expanded(
                child: GetX<UserController>(
                    init: UserController(),
                    builder: (exerciseController) {
                      return ListView.builder(
                        itemCount: exerciseController.getdayExercise.length,
                        itemBuilder: (BuildContext context, int index) {
                          int myIndex = index + 1;
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                myIndex == 1
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Week 1',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                      )
                                    : const SizedBox(),
                                myIndex == 8
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Week 2',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                      )
                                    : const SizedBox(),
                                myIndex == 15
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Week 3',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                      )
                                    : const SizedBox(),
                                myIndex == 23
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Week 4',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                      )
                                    : const SizedBox(),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      () => ClassicExercisePage(
                                          docId: exerciseController
                                              .getdayExercise[index].id!,
                                          dayWiseExerciseModel:
                                              exerciseController
                                                  .getdayExercise[index],
                                          getData: classicData[index]),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                          height:
                                              6 * SizeConfig.heightMultiplier,
                                          width: 6 * SizeConfig.widthMultiplier,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: primaryColor,
                                          ),
                                          child: exerciseController
                                                  .getdayExercise[index]
                                                  .isStart!
                                              ? const Icon(Icons.done,
                                                  color: Colors.white, size: 12)
                                              : const SizedBox()),
                                      SizedBox(
                                          width:
                                              2 * SizeConfig.widthMultiplier),
                                      Container(
                                        width: 80 * SizeConfig.widthMultiplier,
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: exerciseController
                                                  .getdayExercise[index]
                                                  .isStart!
                                              ? primaryColor
                                              : Colors.grey[300],
                                          borderRadius: BorderRadius.circular(
                                              defaultBorderRadius),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                exerciseController
                                                    .getdayExercise[index].day!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1!
                                                    .copyWith(
                                                      color: exerciseController
                                                              .getdayExercise[
                                                                  index]
                                                              .isStart!
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontWeight:
                                                          exerciseController
                                                                  .getdayExercise[
                                                                      index]
                                                                  .isStart!
                                                              ? FontWeight.bold
                                                              : FontWeight.w400,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }),
              ),
              // TextButton(
              //     onPressed: () {
              //       con.addGainData();
              //     },
              //     child: Text('add')),
            ],
          ),
        ),
      ),
    );
  }
}
