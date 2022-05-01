import 'package:fitden_homeworkout/constants/icons.dart';
import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final int steps;
  final double miles, calories, duration;
  const DashboardCard(this.steps, this.miles, this.calories, this.duration,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Column(
                children: [
                  // this is for the count in foot step and edit button
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 5 * SizeConfig.widthMultiplier),
                    child: Text(steps.toString(),
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ],
          ),
        ),

        // this is botton part
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CaloriesCounter(
              imgPath: locations,
              count: miles.toStringAsFixed(3),
              heading: 'Miles',
            ),
            CaloriesCounter(
              imgPath: caloriesIcon,
              count: calories.toStringAsFixed(3),
              heading: 'Calories',
            ),
          ],
        ),
      ],
    );
  }
}

class CaloriesCounter extends StatelessWidget {
  const CaloriesCounter({
    Key? key,
    required this.count,
    required this.heading,
    required this.imgPath,
  }) : super(key: key);
  final String imgPath;
  final String count;
  final String heading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imgPath,
          height: 30,
        ),
        Text(
          count,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.black),
        ),
        Text(
          heading,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
