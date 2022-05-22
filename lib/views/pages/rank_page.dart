import 'package:fitden_homeworkout/constants/consts.dart';
import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:flutter/material.dart';

class RankPage extends StatelessWidget {
  const RankPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: 100 * SizeConfig.heightMultiplier,
        width: 100 * SizeConfig.widthMultiplier,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 5 * SizeConfig.widthMultiplier,
              vertical: 5 * SizeConfig.heightMultiplier),
          child: Column(
            children: [
              Container(
                height: 30 * SizeConfig.heightMultiplier,
                width: 100 * SizeConfig.widthMultiplier,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 18),
                    ]),
                child: Image.asset(
                    'assets/animations/00011201-3-4-Sit-up_Waist.gif',
                    fit: BoxFit.cover),
              ),
              SizedBox(height: 3 * SizeConfig.heightMultiplier),
              Text(
                'You earned silver medal',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 3 * SizeConfig.heightMultiplier),
              Text(
                'You have completed continuesouly 7 days exercise nd earned silver medal CONGRATULATIONS',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.grey),
              ),
              SizedBox(height: 2 * SizeConfig.heightMultiplier),
              Text(
                "Now lets move to gold medals 'Never Give Up' ",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
