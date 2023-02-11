import 'package:flutter/material.dart';
import 'package:task_twitter_clone/consts/app_color.dart';
import 'package:task_twitter_clone/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter',
      theme: ThemeData(
        fontFamily: "SofiaSans",
        scaffoldBackgroundColor: AppColor.appBarBackgroundColor,
        primarySwatch: AppColor.appPrimarySwatch,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.appBarBackgroundColor,
          elevation: 1,
        ),
      ),
      home: const TabsScreen(),
    );
  }
}
