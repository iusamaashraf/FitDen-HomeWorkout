import 'package:fitden_homeworkout/constants/colors.dart';
import 'package:fitden_homeworkout/constants/consts.dart';
import 'package:fitden_homeworkout/controllers/user_controller.dart';
import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:fitden_homeworkout/views/widgets/floating_action_btn.dart';
import 'package:fitden_homeworkout/views/widgets/my_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:get/get.dart';

import 'exercise_type_page.dart';

enum HeightUnit { ft, cm }

// ignore: must_be_immutable
class UserheightPage extends StatefulWidget {
  UserheightPage({Key? key, required this.age}) : super(key: key);
  String age;
  @override
  State<UserheightPage> createState() => _UserheightPageState();
}

double offsetDx = 0.0;
double startValue = 0.0;
double differ = 0.0;
int index = 60;
double containerWidth = 100;
int count = 0;
int direction = 0;

class _UserheightPageState extends State<UserheightPage>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late SequenceAnimation sequenceAnimation1;
  late AnimationController _controller2;
  late SequenceAnimation sequenceAnimation2;
  int? ft;
  int? inches;
  int? total;
  @override
  void initState() {
    ft = 0;
    inches = 0;
    total = ft! + inches!;

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
          if (index == 50) {
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

  HeightUnit selectedUnit = HeightUnit.ft;
  TextEditingController heightController = TextEditingController();
  UserController con = Get.put(UserController());

  String? cm;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Get.to(() => const ExperianceLvelPage());
        floatingActionButton: FloatingActionBtn(
            onPressed: () {
              print(heightController.text);

              // print(ft.toString() + inches.toString());
              con.updateUserDetail(widget.age.toString(),
                  heightController.text.toString(), index.toString(), '');

              Get.to(() => ExerciseTypePage(
                    age: widget.age,
                    height: heightController.text.toString(),
                    weight: index.toString(),
                  ));
            },
            text: 'Continue'),
        backgroundColor: Colors.white,
        appBar: const MyAppBar(
          text: ' User Data',
          isShowText: true,
        ),
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 7 * SizeConfig.widthMultiplier),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Select height',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 2 * SizeConfig.heightMultiplier),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: SizeConfig.widthMultiplier * 60,
                    height: 7 * SizeConfig.heightMultiplier,
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryColor),
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius / 2)),
                    child: TextFormField(
                      onTap: selectedUnit == HeightUnit.ft
                          ? () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              showCupertinoModalPopup(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height: 200,
                                      color: Colors.grey,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: CupertinoPicker(
                                              itemExtent: 32.0,
                                              onSelectedItemChanged:
                                                  (int index) {
                                                setState(() {
                                                  ft = (index + 1);
                                                  heightController.text =
                                                      "$ft' $inches\"";
                                                });
                                              },
                                              children:
                                                  List.generate(12, (index) {
                                                return Center(
                                                  child: Text('${index + 1}'),
                                                );
                                              }),
                                            ),
                                          ),
                                          const Expanded(
                                              flex: 1,
                                              child: Center(
                                                  child: Text('ft',
                                                      style: TextStyle(
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                      )))),
                                          Expanded(
                                            child: CupertinoPicker(
                                              itemExtent: 32.0,
                                              onSelectedItemChanged:
                                                  (int index) {
                                                setState(() {
                                                  inches = (index);
                                                  heightController.text =
                                                      "$ft' $inches\"";
                                                });
                                              },
                                              children:
                                                  List.generate(12, (index) {
                                                return Center(
                                                  child: Text('$index'),
                                                );
                                              }),
                                            ),
                                          ),
                                          const Expanded(
                                            flex: 3,
                                            child: Center(
                                                child: Text('inches',
                                                    style: TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontSize: 16,
                                                      color: Colors.black,
                                                    ))),
                                          )
                                        ],
                                      ),
                                    );
                                  });
                            }
                          : null,
                      controller: heightController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      cursorColor: const Color(0xFF4C4ED7),
                      decoration: InputDecoration(
                        hintText: selectedUnit == HeightUnit.ft
                            ? "Inches: __' __\""
                            : 'Centimeters: __',
                        hintStyle: const TextStyle(color: Colors.grey),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
                      ],
                    ),
                  ),
                  SizedBox(width: SizeConfig.widthMultiplier * 2),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthMultiplier),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (heightController.text.isEmpty) {
                            selectedUnit = HeightUnit.ft;
                          } else {
                            selectedUnit = HeightUnit.ft;
                            checkHeightUnit();
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: selectedUnit == HeightUnit.ft
                                ? primaryColor
                                : Colors.transparent,
                          ),
                          color: Colors.transparent,
                        ),
                        width: 31,
                        height: 31,
                        child: const Center(
                            child: Text('ft', style: TextStyle(fontSize: 16))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthMultiplier),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (heightController.text.isEmpty) {
                            selectedUnit = HeightUnit.cm;
                          } else {
                            selectedUnit = HeightUnit.cm;
                            checkHeightUnit();
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: selectedUnit == HeightUnit.cm
                                ? const Color(0xFFFF7401)
                                : Colors.transparent,
                          ),
                          color: Colors.transparent,
                        ),
                        width: 31,
                        height: 31,
                        child: const Center(
                            child: Text('cm', style: TextStyle(fontSize: 16))),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20 * SizeConfig.heightMultiplier),
              Text(
                'Select Weight',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 2 * SizeConfig.heightMultiplier),
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
                            alignment:
                                Alignment(offsetDx.clamp(-2.2, 2.2), 0.0),
                            child: AnimatedContainer(
                              duration: const Duration(
                                milliseconds: 200,
                              ),
                              height: 100,
                              width: 100,
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
        ));
  }

  cmToInches(inchess) {
    ft = inchess ~/ 12;
    inches = inchess % 12;
  }

  inchesToCm() {
    double inchesTotal = (ft! * 12.0) + inches!;
    cm = (inchesTotal * 2.54).toStringAsPrecision(5);
    heightController.text = cm!;
  }

  void checkHeightUnit() {
    if (selectedUnit == HeightUnit.ft) {
      setState(() {
        int inchess = (double.parse(heightController.text) ~/ 2.54).toInt();
        cmToInches(inchess);
        heightController.text = '$ft\' $inches"';
      });
    } else if (selectedUnit == HeightUnit.cm) {
      setState(() {
        inchesToCm();
      });
    }
  }
}
