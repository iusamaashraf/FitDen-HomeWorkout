// import 'package:fitden_homeworkout/controllers/user_controller.dart';
// import 'package:fitden_homeworkout/views/pages/authentication/sign_in/sign_in_page.dart';
// import 'package:fitden_homeworkout/views/pages/root/root_page.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class InitialRoot extends StatelessWidget {
//   const InitialRoot({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetX<UserController>(
//       init: UserController(),
//       initState: (_) {
//         Get.put<UserController>(UserController());
//       },
//       builder: (_) {
//         // ignore: unnecessary_null_comparison
//         if (Get.find<UserController>().users != null) {
//           return const RootPage();
//         } else {
//           return SignInPage();
//         }
//       },
//     );
//   }
// }
