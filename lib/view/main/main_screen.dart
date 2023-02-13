import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_flutter/view/home/screen/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
        locale: Locale("fa"),
        debugShowCheckedModeBanner: false,
        home: HomeScreen()
    );
  }
}