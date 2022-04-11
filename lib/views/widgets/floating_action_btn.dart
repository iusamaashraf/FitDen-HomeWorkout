import 'package:fitden_homeworkout/constants/colors.dart';
import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:flutter/material.dart';

class FloatingActionBtn extends StatelessWidget {
  const FloatingActionBtn({
    required this.onPressed,
    required this.text,
    Key? key,
  }) : super(key: key);
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5 * SizeConfig.heightMultiplier,
      width: 40 * SizeConfig.widthMultiplier,
      child: FloatingActionButton(
        onPressed: onPressed,
        isExtended: true,
        backgroundColor: primaryColor,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
