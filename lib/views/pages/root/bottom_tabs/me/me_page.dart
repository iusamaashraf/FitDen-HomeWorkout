import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:fitden_homeworkout/constants/colors.dart';
import 'package:fitden_homeworkout/constants/consts.dart';
import 'package:fitden_homeworkout/constants/icons.dart';
import 'package:fitden_homeworkout/controllers/user_controller.dart';
import 'package:fitden_homeworkout/utils/size_config.dart';
import 'package:fitden_homeworkout/views/pages/user_info/user_age_page.dart';
import 'package:fitden_homeworkout/views/widgets/my_app_bar.dart';
import 'package:fitden_homeworkout/views/widgets/my_button.dart';
import 'package:fitden_homeworkout/views/widgets/my_inputfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'components/bottom_sheet_button.dart';
import 'water_remainder_page.dart';

class MePage extends StatefulWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  final UserController con = Get.put(UserController());
  final TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    con.getUserDetail();
    super.initState();
  }

//this method is used for image boxfit like. circular or rectagular
  Image? myImage;
  Future<Image> convertFileToImage(File picture) async {
    List<int> imageBase64 = picture.readAsBytesSync();
    String imageAsString = base64Encode(imageBase64);
    Uint8List uint8list = base64.decode(imageAsString);
    Image image = Image.memory(uint8list);
    setState(() {
      myImage = image;
    });
    // ignore: avoid_print
    print('MY image is $myImage');
    return image;
  }

//this method is used for picking image
  File? image;
  Future pickImage(ImageSource sr) async {
    try {
      final image = await ImagePicker().pickImage(source: sr);
      if (image == null) {}
      final imageTemporary = File(image!.path);
      setState(() {
        this.image = imageTemporary;
        convertFileToImage(File(image.path));
        con.uploadImage();
        // ignore: avoid_print
        print('The image is${convertFileToImage(File(image.path))}');
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('failed to pick image: $e');
    }
  }

//here is the function to get image source

  showOptionDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          //for picking video functionality
          SimpleDialogOption(
            onPressed: () {
              pickImage(ImageSource.gallery);
              // con.uploadImage(myImage.image);
              Get.back();
            },
            child: Row(
              children: [
                const Icon(Icons.image, color: primaryColor),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text('Gallery',
                      style: Theme.of(context).textTheme.subtitle1!),
                ),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () {
              pickImage(ImageSource.camera);
              Get.back();
            },
            child: Row(
              children: [
                const Icon(Icons.camera_alt, color: primaryColor),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text('Camera',
                      style: Theme.of(context).textTheme.subtitle1!),
                ),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () => Get.back(),
            child: Row(
              children: [
                const Icon(Icons.cancel, color: Colors.grey),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text('Cancel',
                      style: Theme.of(context).textTheme.subtitle1!),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

//here is the function to change the username from firestore database
  usernameUpdate(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          //for picking video functionality
          SimpleDialogOption(
            onPressed: () {
              pickImage(ImageSource.gallery);
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Column(
                children: [
                  MyInputField(
                      hintText: 'Edit username',
                      controller: usernameController,
                      validator: (val) {
                        return '';
                      }),
                  SizedBox(height: 2 * SizeConfig.heightMultiplier),
                  Mybutton(
                      onTap: () {
                        con.usernameUpdate(usernameController.text);
                        usernameController.clear();
                      },
                      text: 'Update'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        actions: [
          //this butotn is used for the edit profile which opens the bottom
          IconButton(
            onPressed: () {
              openBottomSheet(context);
            },
            icon: const Icon(Icons.person),
            color: Colors.black,
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 6 * SizeConfig.widthMultiplier),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GetX<UserController>(
                init: UserController(),
                builder: (con) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: image != null
                            ? Container(
                                height: 10 * SizeConfig.heightMultiplier,
                                width: 25 * SizeConfig.widthMultiplier,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(image: myImage!.image),
                                ),
                              )
                            : const CircleAvatar(
                                backgroundImage: AssetImage(avatar),
                              ),
                      ),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier),
                      Text(
                        con.getuser.username.toString().toUpperCase(),
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 3 * SizeConfig.heightMultiplier),
                      ElevateButton(
                        onTap: () {
                          Get.to(() => const WaterRemainderPage());
                        },
                        text: 'Water Remainder',
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> openBottomSheet(BuildContext context) {
    return showModalBottomSheet<dynamic>(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return Wrap(children: <Widget>[
            SizedBox(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 2 * SizeConfig.heightMultiplier),
                      Text(
                        con.getuser.username.toString().toUpperCase(),
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        con.getuser.email.toString(),
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier),
                      BottomSheetButton(
                        onTap: () {
                          usernameUpdate(context);
                        },
                        text: 'Edit Username',
                      ),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier),
                      BottomSheetButton(
                        onTap: () {
                          showOptionDialog(context);
                        },
                        text: 'Edit Avatar',
                      ),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier),
                      BottomSheetButton(
                        onTap: () {
                          con.signOut();
                        },
                        text: 'Log Out',
                      ),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier),
                    ],
                  ),
                ),
              ),
            )
          ]);
        });
  }
}

class ElevateButton extends StatelessWidget {
  const ElevateButton({
    required this.onTap,
    required this.text,
    Key? key,
  }) : super(key: key);
  final VoidCallback onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.5 * SizeConfig.heightMultiplier,
      width: 90 * SizeConfig.widthMultiplier,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          primary: Colors.white, // background
          onPrimary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ), // foreground
        ),
        onPressed: onTap,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 3 * SizeConfig.widthMultiplier,
              ),
              Text(text)
            ],
          ),
        ),
      ),
    );
  }
}
