import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MottuMarvelApp extends StatelessWidget {
  const MottuMarvelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MottuMarvel",
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () {
            return const Scaffold();
          },
        ),
      ],
    );
  }
}
