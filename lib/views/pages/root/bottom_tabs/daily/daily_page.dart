import 'dart:math';

import 'package:fitden_homeworkout/constants/colors.dart';
import 'package:fitden_homeworkout/constants/consts.dart';
import 'package:fitden_homeworkout/controllers/basic_controller.dart';
import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:fitden_homeworkout/views/pages/root/bottom_tabs/daily/components/water_progress_bar.dart';
import 'package:fitden_homeworkout/views/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/water_tracker_button.dart';
import 'step_counter/components/dashboard_card.dart';
import 'water_intake/water_intake_history.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({Key? key}) : super(key: key);

  @override
  State<DailyPage> createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  final BasicController con = Get.put(BasicController());

  @override
  void initState() {
    super.initState();
    con.getWaterDetail();
  }
  //values for step counter

  double x = 0.0;
  double y = 0.0;
  double z = 0.0;
  double miles = 0.0;
  double duration = 0.0;
  double calories = 0.0;
  double addValue = 0.025;
  int steps = 0;
  double previousDistacne = 0.0;
  double distance = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(text: 'text'),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox.expand(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //This section for water intake in a day
            Container(
              margin: const EdgeInsets.all(defaultPadding),
              height: 40 * SizeConfig.heightMultiplier,
              width: 100 * SizeConfig.widthMultiplier,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 18,
                  ),
                ],
                borderRadius: BorderRadius.circular(
                  defaultBorderRadius,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Text('Water Tracker',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  SizedBox(height: 2 * SizeConfig.heightMultiplier),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      con.getwater.numberofglass != null
                          ? SizedBox(
                              height: 120,
                              width: 120,
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.grey,
                                color: primaryColor,
                                strokeWidth: 8,
                                value: con.getwater.numberofglass! / 8,
                              ),
                            )
                          : const Center(child: CircularProgressIndicator()),
                      Column(
                        children: [
                          Text('Min. glass 8/',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(color: primaryColor)),
                          Obx(
                            () => con.getwater.numberofglass != null
                                ? Text(con.getwater.numberofglass.toString())
                                : const Text('0'),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WaterTrackerButton(
                        onTap: () {
                          if (con.getwater.numberofglass! > 0) {
                            con.getwater.numberofglass =
                                con.getwater.numberofglass! - 1;
                          }
                          con.updateWaterTracker(
                              con.getwater.numberofglass!.toInt());
                        },
                        text: '-',
                      ),
                      SizedBox(width: 9 * SizeConfig.widthMultiplier),
                      WaterTrackerButton(
                        onTap: () {
                          con.waterTracker(
                              numberofglass: con.getwater.numberofglass != null
                                  ? con.getwater.numberofglass!
                                  : 0);
                          con.getwater.numberofglass =
                              con.getwater.numberofglass! + 1;
                          con.updateWaterTracker(
                              con.getwater.numberofglass!.toInt());
                        },
                        text: '+',
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Align(
                  //     alignment: Alignment.bottomRight,
                  //     child: InkWell(
                  //       onTap: () {
                  //         //water remainder detail button
                  //         Get.to(() => const WaterInktakeHistoryPage());
                  //       },
                  //       child: Text(
                  //         'See Details',
                  //         style: Theme.of(context)
                  //             .textTheme
                  //             .subtitle2!
                  //             .copyWith(
                  //                 color: Colors.grey.withOpacity(0.5),
                  //                 fontWeight: FontWeight.w500),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),

            SizedBox(height: 1 * SizeConfig.heightMultiplier),
            // //This section for step counter
            // Container(
            //   margin: const EdgeInsets.all(defaultPadding),
            //   height: 45 * SizeConfig.heightMultiplier,
            //   width: 100 * SizeConfig.widthMultiplier,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     boxShadow: const [
            //       BoxShadow(
            //         color: Colors.black12,
            //         blurRadius: 18,
            //       ),
            //     ],
            //     borderRadius: BorderRadius.circular(
            //       defaultBorderRadius,
            //     ),
            //   ),
            //   child: Column(
            //     children: [
            //       const SizedBox(height: 10),
            //       Text('Step Counter',
            //           style: Theme.of(context).textTheme.subtitle1!.copyWith(
            //               color: Colors.black, fontWeight: FontWeight.bold)),
            //       StreamBuilder<AccelerometerEvent>(
            //         stream: SensorsPlatform.instance.accelerometerEvents,
            //         builder: (context, snapShort) {
            //           if (snapShort.hasData) {
            //             x = snapShort.data!.x;
            //             y = snapShort.data!.y;
            //             z = snapShort.data!.z;
            //             distance = getValue(x, y, z);
            //             if (distance > 20) {
            //               steps++;
            //             }
            //             calories = calculateCalories(steps);
            //             miles = calculateMiles(steps);
            //           }
            //           return
            //               // ignore: sized_box_for_whitespace
            //               Container(
            //             height: 300,
            //             width: 400,
            //             child: SingleChildScrollView(
            //               child: Column(
            //                 children: [
            //                   DashboardCard(steps, miles, calories, duration),
            //                 ],
            //               ),
            //             ),
            //           );
            //         },
            //       ),
            //       const Spacer(),
            //       // Padding(
            //       //   padding: const EdgeInsets.only(bottom: 8, right: 8),
            //       //   child: Align(
            //       //     alignment: Alignment.bottomRight,
            //       //     child: InkWell(
            //       //       onTap: () {
            //       //         //Step Counter detail button
            //       //       },
            //       //       child: Text(
            //       //         'See Details',
            //       //         style: Theme.of(context)
            //       //             .textTheme
            //       //             .subtitle2!
            //       //             .copyWith(
            //       //                 color: Colors.grey.withOpacity(0.5),
            //       //                 fontWeight: FontWeight.w500),
            //       //       ),
            //       //     ),
            //       //   ),
            //       // ),
            //     ],
            //   ),
            // ),
          ],
        )),
      ),
    );
  }

  double getValue(double x, double y, double z) {
    double magnitude = sqrt(x * x + y * y + z * z);
    getPreviousValue();
    double modDistance = magnitude - previousDistacne;
    setPreviousValue(magnitude);
    return modDistance;
  }

  void setPreviousValue(double distance) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setDouble("preValue", distance);
  }

  void getPreviousValue() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setState(() {
      previousDistacne = _pref.getDouble("preValue") ?? 0.0;
    });
  }

  // void calculate data
  double calculateMiles(int steps) {
    double milesValue = (2.2 * steps) / 5280;
    return milesValue;
  }

  double calculateCalories(int steps) {
    double caloriesValue = (steps * 0.0566);
    return caloriesValue;
  }
}
