import 'package:fitden_homeworkout/constants/consts.dart';
import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.icon,
    required this.color,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final String icon;
  final VoidCallback onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 7 * SizeConfig.heightMultiplier,
        width: 90 * SizeConfig.widthMultiplier,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 4 * SizeConfig.widthMultiplier),
              child: SvgPicture.asset(
                icon,
                height: 20,
                color: color,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 2 * SizeConfig.widthMultiplier),
              child: Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
