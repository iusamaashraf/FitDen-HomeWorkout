import 'package:fitden_homeworkout/constants/colors.dart';
import 'package:fitden_homeworkout/constants/consts.dart';
import 'package:fitden_homeworkout/models/classic_model.dart';
import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:fitden_homeworkout/views/pages/root/bottom_tabs/classic/classic_exercise_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ClassicPage extends StatefulWidget {
  const ClassicPage({Key? key}) : super(key: key);

  @override
  State<ClassicPage> createState() => _ClassicPageState();
}

class _ClassicPageState extends State<ClassicPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
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
                child: ListView.builder(
                  itemCount: classicData.length,
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
                                              fontWeight: FontWeight.w600)),
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
                                              fontWeight: FontWeight.w600)),
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
                                              fontWeight: FontWeight.w600)),
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
                                              fontWeight: FontWeight.w600)),
                                )
                              : const SizedBox(),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => ClassicExercisePage(
                                  getData: classicData[index]));
                              setState(() {
                                classicData[index].isDone = true;
                                classicData[index].isStart = true;
                              });
                            },
                            child: Row(
                              children: [
                                Container(
                                    height: 6 * SizeConfig.heightMultiplier,
                                    width: 6 * SizeConfig.widthMultiplier,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: primaryColor,
                                    ),
                                    child: classicData[index].isDone!
                                        ? const Icon(Icons.done,
                                            color: Colors.white, size: 12)
                                        : const SizedBox()),
                                SizedBox(width: 2 * SizeConfig.widthMultiplier),
                                Container(
                                  width: 80 * SizeConfig.widthMultiplier,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: classicData[index].isStart!
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
                                          classicData[index].day! +
                                              " " +
                                              myIndex.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1!
                                              .copyWith(
                                                color:
                                                    classicData[index].isStart!
                                                        ? Colors.white
                                                        : Colors.black,
                                                fontWeight:
                                                    classicData[index].isStart!
                                                        ? FontWeight.bold
                                                        : FontWeight.w400,
                                              ),
                                        ),
                                        Text(
                                          classicData[index].isStart!
                                              ? classicData[index]
                                                  .workoutCompleted!
                                              : classicData[index]
                                                  .totalExercises!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1!
                                              .copyWith(
                                                color:
                                                    classicData[index].isStart!
                                                        ? Colors.white
                                                        : Colors.black,
                                                fontWeight:
                                                    classicData[index].isStart!
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
