import 'package:fitden_homeworkout/controllers/user_controller.dart';
import 'package:fitden_homeworkout/models/classic_list.dart';
import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:flutter/material.dart';

class StartExercisePage extends StatelessWidget {
  StartExercisePage({Key? key, required this.getData}) : super(key: key);
  ClassicList getData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: 100 * SizeConfig.heightMultiplier,
          width: 100 * SizeConfig.widthMultiplier,
          child: Column(
            children: [
              Image.asset(getData.image!),
              Text(getData.title!,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.black)),
              Text(getData.description!,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.black)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.done)),
            ],
          ),
        ));
  }
}
