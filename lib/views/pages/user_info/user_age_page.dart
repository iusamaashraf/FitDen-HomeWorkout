import 'package:fitden_homeworkout/constants/colors.dart';
import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:fitden_homeworkout/views/pages/user_info/user_height_page.dart';
import 'package:fitden_homeworkout/views/widgets/floating_action_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:get/get.dart';

class UserAgePage extends StatefulWidget {
  const UserAgePage({Key? key}) : super(key: key);

  @override
  State<UserAgePage> createState() => _UserAgePageState();
}

double offsetDx = 0.0;
double startValue = 0.0;
double differ = 0.0;
int index = 16;
double containerWidth = 100;
int count = 0;
int direction = 0;

class _UserAgePageState extends State<UserAgePage>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late SequenceAnimation sequenceAnimation1;
  late AnimationController _controller2;
  late SequenceAnimation sequenceAnimation2;

  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 375),
    );

    sequenceAnimation1 = SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween(begin: 0.0, end: -1.5),
          from: const Duration(milliseconds: 0),
          to: const Duration(milliseconds: 200),
          tag: 'container',
        )
        .addAnimatable(
          animatable: Tween(begin: 1.0, end: 0.0),
          from: const Duration(milliseconds: 0),
          to: const Duration(milliseconds: 200),
          tag: 'containerOpacity',
        )
        .addAnimatable(
          animatable: Tween(begin: -1.5, end: 1.5),
          from: const Duration(milliseconds: 200),
          to: const Duration(milliseconds: 201),
          tag: 'container',
        )
        .addAnimatable(
          animatable: Tween(begin: 1.5, end: 0.0),
          from: const Duration(milliseconds: 201),
          to: const Duration(milliseconds: 500),
          tag: 'container',
        )
        .addAnimatable(
          animatable: Tween(begin: 0.0, end: 1.0),
          from: const Duration(milliseconds: 201),
          to: const Duration(milliseconds: 500),
          tag: 'containerOpacity',
        )
        .animate(_controller1);

    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 375),
    );

    sequenceAnimation2 = SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween(begin: 0.0, end: 1.5),
          from: const Duration(milliseconds: 0),
          to: const Duration(milliseconds: 200),
          tag: 'container',
        )
        .addAnimatable(
          animatable: Tween(begin: 1.0, end: 0.0),
          from: const Duration(milliseconds: 0),
          to: const Duration(milliseconds: 200),
          tag: 'containerOpacity',
        )
        .addAnimatable(
          animatable: Tween(begin: 1.5, end: -1.5),
          from: const Duration(milliseconds: 200),
          to: const Duration(milliseconds: 201),
          tag: 'container',
        )
        .addAnimatable(
          animatable: Tween(begin: -1.5, end: 0.0),
          from: const Duration(milliseconds: 201),
          to: const Duration(milliseconds: 500),
          tag: 'container',
        )
        .addAnimatable(
          animatable: Tween(begin: 0.0, end: 1.0),
          from: const Duration(milliseconds: 201),
          to: const Duration(milliseconds: 500),
          tag: 'containerOpacity',
        )
        .animate(_controller2);

    _controller1.addListener(() {
      setState(() {
        if (_controller1.value > 0.6 && count == 0) {
          index++;
          count++;
        }
        if (_controller1.isCompleted) {
          _controller1.reset();
          count = 0;
          if (offsetDx != 0.0) {
            _controller1.forward();
          }
        }
      });
    });
    _controller2.addListener(() {
      setState(() {
        if (_controller2.value > 0.6 && count == 0) {
          if (index == 14) {
            index;
          } else {
            index--;
          }
          count++;
        }
        if (_controller2.isCompleted) {
          _controller2.reset();
          count = 0;
          if (offsetDx != 0.0) {
            _controller2.forward();
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionBtn(
        onPressed: () {
          Get.to(() => const UserheightPage());
        },
        text: 'Continue',
      ),
      body: SizedBox.expand(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 10 * SizeConfig.heightMultiplier,
              child: Text(
                'Select your age by\ndragging left or right',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: GestureDetector(
                onHorizontalDragStart: (value) {
                  startValue = value.localPosition.distance / 1000;
                },
                onHorizontalDragUpdate: (value) {
                  differ = startValue + value.localPosition.distance / 1000;
                  setState(() {
                    if (startValue > value.localPosition.distance / 1000) {
                      offsetDx = -(0.62 - differ);
                      direction = -1;
                      _controller2.forward();
                    } else if (startValue <
                        value.localPosition.distance / 1000) {
                      offsetDx = (-0.26 + differ);
                      _controller1.forward();
                      direction = 1;
                    }
                  });
                },
                onHorizontalDragEnd: (value) {
                  setState(() {
                    count = 0;
                    offsetDx = 0.0;
                  });
                },
                child: Container(
                    width: double.infinity,
                    height: 120,
                    color: Colors.transparent,
                    child: Stack(
                      children: [
                        Align(
                          alignment: const Alignment(0.5, 0.0),
                          child: Icon(Icons.arrow_forward_ios,
                              color: primaryColor.withOpacity(0.5), size: 40),
                        ),
                        Align(
                          alignment: const Alignment(-0.5, 0.0),
                          child: Icon(Icons.arrow_back_ios,
                              color: primaryColor.withOpacity(0.5), size: 40),
                        ),
                        AnimatedAlign(
                          curve: Curves.elasticOut,
                          duration: const Duration(microseconds: 900),
                          alignment: Alignment(offsetDx.clamp(-2.2, 2.2), 0.0),
                          child: AnimatedContainer(
                            duration: const Duration(
                              milliseconds: 200,
                            ),
                            height: 200,
                            width: 120,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                    color: primaryColor.withOpacity(0.4),
                                    offset: const Offset(0.0, 15.0),
                                    blurRadius: 20,
                                  ),
                                ]),
                            child: Align(
                              alignment: Alignment(
                                  direction == -1
                                      ? sequenceAnimation2['container'].value
                                      : sequenceAnimation1['container'].value,
                                  0.0),
                              child: Opacity(
                                opacity: (direction == -1)
                                    ? sequenceAnimation2['containerOpacity']
                                        .value
                                    : sequenceAnimation1['containerOpacity']
                                        .value,
                                child: Text(
                                  '$index',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
