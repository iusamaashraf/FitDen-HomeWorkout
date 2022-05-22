import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:fitden_homeworkout/views/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return GetMaterialApp(
              theme: ThemeData(fontFamily: 'Montserrat'),
              builder: (context, child) {
                return ScrollConfiguration(
                    behavior: MyBehavior(), child: child!);
              },
              // builder: (context, widget) => ResponsiveWrapper.builder(
              //   BouncingScrollWrapper.builder(context, widget!),
              //   maxWidth: 1200,
              //   minWidth: 360,
              //   defaultScale: true,
              //   breakpoints: [
              //     const ResponsiveBreakpoint.resize(800, name: MOBILE),
              //     const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              //     const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
              //     const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              //     const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
              //   ],
              // ),
              debugShowCheckedModeBanner: false,

              //  builder: DevicePreview.appBuilder,
              home: const SplashPage(),
              // home: const RestPage(),

              //home: const Dashboard(),
            );
          },
        );
      },
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
