import 'package:fitden_homeworkout/constants/colors.dart';
import 'package:fitden_homeworkout/constants/consts.dart';
import 'package:fitden_homeworkout/controllers/basic_controller.dart';
import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:fitden_homeworkout/views/pages/root/bottom_tabs/daily/components/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DailyPage extends StatelessWidget {
  DailyPage({Key? key}) : super(key: key);
  final BasicController con = Get.put(BasicController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            children: [
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
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    SizedBox(height: 2 * SizeConfig.heightMultiplier),
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: CircularProgressBar(),
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
            ],
          ),
        ),
      ),
    );
  }
}

class WaterTrackerButton extends StatelessWidget {
  const WaterTrackerButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 10 * SizeConfig.heightMultiplier,
          width: 10 * SizeConfig.widthMultiplier,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: primaryColor, width: 3),
          ),
          child: Center(
            child: Text(text,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          )),
    );
  }
}
