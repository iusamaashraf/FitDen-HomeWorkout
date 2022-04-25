import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:flutter/material.dart';

class HardElementText extends StatelessWidget {
  const HardElementText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 9 * SizeConfig.heightMultiplier),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "HARD ",
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  letterSpacing: 1.8,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
          ),
          Text(
            "ELEMENT",
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: const Color(0xFF40D876),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.8,
                ),
          ),
        ],
      ),
    );
  }
}
