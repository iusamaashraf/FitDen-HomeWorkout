import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.onTap,
  }) : super(key: key);
  final String icon;
  final VoidCallback onTap;
  final Color iconColor;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 4 * SizeConfig.heightMultiplier,
        width: 12 * SizeConfig.widthMultiplier,
        decoration: BoxDecoration(
            color: bgColor,
            // borderRadius: BorderRadius.circular(defaultBorderRadius),
            shape: BoxShape.circle),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            icon,
            height: 12,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
