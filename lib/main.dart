import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsman/controllerandModel/newsController.dart';
import 'package:newsman/home.dart';
import 'package:newsman/newsScreens/searchScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    NewsController controller = Get.put(NewsController());
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: mainAppBar(),
          body: Home(),
        ),
        theme: ThemeData(fontFamily: 'Poppins'));
  }

  AppBar mainAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 20, 20, 20),
      leading: Icon(
        Icons.newspaper_rounded,
        color: Colors.blue,
      ),
      title: Text(
        'Informer News',
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Get.to(() => SearchPage(), transition: Transition.upToDown);
            },
            icon: Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ))
      ],
    );
  }
}
