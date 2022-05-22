import 'package:fitden_homeworkout/constants/colors.dart';
import 'package:fitden_homeworkout/constants/icons.dart';
import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:flutter/material.dart';

class MePage extends StatelessWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 14 * SizeConfig.imageSizeMultiplier,
                  backgroundColor: primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: CircleAvatar(
                      backgroundImage: const AssetImage(avatar),
                      radius: 14 * SizeConfig.imageSizeMultiplier,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
