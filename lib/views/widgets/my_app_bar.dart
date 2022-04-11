import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    required this.text,
    this.isShowText = false,
    Key? key,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  final String text;
  final bool isShowText;
  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: isShowText
          ? Text(text,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w600))
          : const SizedBox(),
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
    );
  }
}
