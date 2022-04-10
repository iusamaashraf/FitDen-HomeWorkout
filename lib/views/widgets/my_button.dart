import 'package:fitden_homeworkout/constants/colors.dart';
import 'package:fitden_homeworkout/constants/consts.dart';
import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  const Mybutton({
    required this.onTap,
    required this.text,
    Key? key,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 7 * SizeConfig.heightMultiplier,
        width: 80 * SizeConfig.widthMultiplier,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
