import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_flutter/constants/colors/app_colors.dart';
import 'package:todo_app_flutter/constants/routes/routs_pages.dart';
import 'package:todo_app_flutter/view/add_or_edit/screen/add_or_edit_screen.dart';
import 'package:todo_app_flutter/view/home/screen/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
        locale: const Locale("fa"),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.lightYellowColor)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.lightYellowColor)
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(AppColors.lightYellowColor),
              minimumSize: const MaterialStatePropertyAll(Size(double.infinity,50))
            )
          )
        ),
        getPages: [
          GetPage(name: RoutePages.addOrEditPageRoute, page: () => const AddOrEditTodoScreen())
        ],
        home: HomeScreen()
    );
  }
}