import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:flutter/material.dart';

class AboutText extends StatelessWidget {
  const AboutText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 7 * SizeConfig.widthMultiplier),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "About You",
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.8,
              ),
        ),
        SizedBox(
          height: 3 * SizeConfig.heightMultiplier,
        ),
        Text(
          "we want to know more about you, follow the next steps to complete the information",
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.8,
              ),
        )
      ]),
    );
  }
}
