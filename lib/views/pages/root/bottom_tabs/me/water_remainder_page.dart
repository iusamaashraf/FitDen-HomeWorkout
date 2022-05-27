import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:fitden_homeworkout/views/widgets/my_app_bar.dart';
import 'package:fitden_homeworkout/views/widgets/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class WaterRemainderPage extends StatefulWidget {
  const WaterRemainderPage({Key? key}) : super(key: key);

  @override
  State<WaterRemainderPage> createState() => _WaterRemainderPageState();
}

class _WaterRemainderPageState extends State<WaterRemainderPage> {
  String time = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MyAppBar(text: 'Remainder', isShowText: true),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Column(
              children: [
                Container(
                  height: 20 * SizeConfig.heightMultiplier,
                  width: 40 * SizeConfig.widthMultiplier,
                  decoration: BoxDecoration(
                      color: Colors.grey[100], shape: BoxShape.circle),
                  child: Icon(Icons.notifications,
                      size: 8 * SizeConfig.heightMultiplier,
                      color: Colors.amber),
                ),
                Text('Please set your remainder',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: Colors.grey)),
              ],
            ),
            const Spacer(),
            Mybutton(
                onTap: () {
                  showBarModalBottomSheet(
                    context: context,
                    builder: (context) => SizedBox(
                      height: 40 * SizeConfig.heightMultiplier,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.time,
                        onDateTimeChanged: (value) {
                          setState(() {
                            time = value.toString();
                          });
                        },
                        initialDateTime: DateTime.now(),
                      ),
                    ),
                  );
                },
                text: 'Add'),
            SizedBox(height: 5 * SizeConfig.heightMultiplier),
          ],
        ),
      ),
    );
  }
}
