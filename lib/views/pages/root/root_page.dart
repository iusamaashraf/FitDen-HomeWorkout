import 'package:fitden_homeworkout/constants/colors.dart';
import 'package:fitden_homeworkout/constants/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottom_tabs/classic/classic_page.dart';
import 'bottom_tabs/daily/daily_page.dart';
import 'bottom_tabs/me/me_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentTab = 0;
  final List<Widget> screens = [
    const ClassicPage(),
    DailyPage(),
    const MePage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const ClassicPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Get.to(() => DailyPage());
        },
        child: const Icon(Icons.library_books_outlined),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        elevation: defaultPadding,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = const ClassicPage();
                    currentTab = 0;
                  });
                },
                child: Column(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 3,
                        width: 20,
                        color: currentTab == 0
                            ? primaryColor
                            : Colors.transparent),
                    const SizedBox(height: 10),
                    Icon(
                      Icons.timer,
                      color: currentTab == 0 ? primaryColor : Colors.grey,
                    ),
                    Text('Classic',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            color:
                                currentTab == 0 ? primaryColor : Colors.grey))
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = const MePage();
                    currentTab = 2;
                  });
                },
                child: Column(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 3,
                        width: 20,
                        color: currentTab == 2
                            ? primaryColor
                            : Colors.transparent),
                    const SizedBox(height: 10),
                    Icon(
                      Icons.person,
                      color: currentTab == 2 ? primaryColor : Colors.grey,
                    ),
                    Text('Me',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            color:
                                currentTab == 2 ? primaryColor : Colors.grey))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: Colors.white,
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
    );
  }
}
