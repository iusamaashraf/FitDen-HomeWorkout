import 'package:fitden_homeworkout/constants/colors.dart';
import 'package:fitden_homeworkout/models/classic_model.dart';
import 'package:fitden_homeworkout/views/pages/root/bottom_tabs/classic/classic_exercise_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class RestPage extends StatefulWidget {
  const RestPage({Key? key}) : super(key: key);

  @override
  State<RestPage> createState() => _RestPageState();
}

final FlutterTts flutterTts = FlutterTts();
speak() async {
  await flutterTts.setLanguage("en-US");
  await flutterTts.setPitch(1);
  await flutterTts
      .speak('Take a rest of 20 seconds after that move to next exercise');
}

class _RestPageState extends State<RestPage> {
  final CountdownController _controller = CountdownController(autoStart: true);
  @override
  void initState() {
    speak();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Take a rest Rest',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            Countdown(
                controller: _controller,
                seconds: 20,
                build: (_, double time) => Text(
                      time.toString(),
                      style: const TextStyle(
                        fontSize: 100,
                        color: Colors.white,
                      ),
                    ),
                interval: const Duration(milliseconds: 100),
                onFinished: () {
                  Get.offAll(() => ClassicExercisePage(getData: Classic()));
                })
          ],
        ),
      ),
    );
  }
}
