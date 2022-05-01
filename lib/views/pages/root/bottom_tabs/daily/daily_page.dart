import 'dart:math';

import 'package:fitden_homeworkout/constants/consts.dart';
import 'package:fitden_homeworkout/controllers/basic_controller.dart';
import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:fitden_homeworkout/views/pages/root/bottom_tabs/daily/components/water_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/water_tracker_button.dart';
import 'step_counter/components/dashboard_card.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({Key? key}) : super(key: key);

  @override
  State<DailyPage> createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  final BasicController con = Get.put(BasicController());

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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox.expand(
          child: SingleChildScrollView(
            child: Column(
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
                      Text('Water Tracker',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier),
                      SizedBox(
                        height: 120,
                        width: 120,
                        child: WaterCircularProgressBar(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WaterTrackerButton(
                            onTap: () {
                              con.decrement();
                            },
                            text: '-',
                          ),
                          SizedBox(width: 9 * SizeConfig.widthMultiplier),
                          WaterTrackerButton(
                            onTap: () {
                              con.increment();
                            },
                            text: '+',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 2 * SizeConfig.heightMultiplier),
                //This section for step counter
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
                    children: [
                      StreamBuilder<AccelerometerEvent>(
                        stream: SensorsPlatform.instance.accelerometerEvents,
                        builder: (context, snapShort) {
                          if (snapShort.hasData) {
                            x = snapShort.data!.x;
                            y = snapShort.data!.y;
                            z = snapShort.data!.z;
                            distance = getValue(x, y, z);
                            if (distance > 20) {
                              steps++;
                            }
                            calories = calculateCalories(steps);
                            miles = calculateMiles(steps);
                          }
                          return
                              // ignore: sized_box_for_whitespace
                              Container(
                            height: 300,
                            width: 400,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  DashboardCard(
                                      steps, miles, calories, duration),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
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
