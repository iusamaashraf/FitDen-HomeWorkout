import 'package:fitden_homeworkout/constants/colors.dart';
import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:flutter/material.dart';

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
