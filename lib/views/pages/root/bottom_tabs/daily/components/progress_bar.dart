import 'package:fitden_homeworkout/constants/colors.dart';
import 'package:fitden_homeworkout/constants/images.dart';
import 'package:fitden_homeworkout/controllers/basic_controller.dart';
import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: constant_identifier_names
const two_pi = 3.14 * 2;

class CircularProgressBar extends StatelessWidget {
  CircularProgressBar({Key? key}) : super(key: key);
  final BasicController con = Get.put(BasicController());
  @override
  Widget build(BuildContext context) {
    const size = 120.0;
    return SafeArea(
      child: Scaffold(
        body: SizedBox.expand(
          child: TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 1),
            duration: const Duration(seconds: 1),
            builder: (context, value, child) {
              return Container(
                color: Colors.white,
                height: size,
                width: size,
                child: Stack(
                  children: [
                    ShaderMask(
                      shaderCallback: (rect) {
                        return SweepGradient(
                          endAngle: two_pi,
                          stops: [
                            0.0,
                            con.trackerCounter.value.toDouble() / 8,
                          ],
                          colors: const [primaryColor, Colors.white],
                        ).createShader(rect);
                      },
                      child: Container(
                        height: size,
                        width: size,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade50,
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: size - 20,
                        width: size - 20,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(drop,
                                height: 3 * SizeConfig.heightMultiplier),
                            SizedBox(height: SizeConfig.imageSizeMultiplier),
                            Obx(() => Text(con.trackerCounter.value.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))),
                            Text('8 cups / day',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      color: Colors.grey,
                                    )),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
