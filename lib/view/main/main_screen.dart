import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_flutter/common/constants/colors/app_colors.dart';
import 'package:todo_app_flutter/common/constants/routes/routs_pages.dart';
import 'package:todo_app_flutter/controller/bindig_controllers/binding_controllers.dart';
import 'package:todo_app_flutter/view/add_or_edit/screen/add_or_edit_screen.dart';
import 'package:todo_app_flutter/view/home/screen/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
        initialBinding: BindingControllers(),
        locale: const Locale("fa"), // راست چین کردن برنامه
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          //  تم  text field های برنامه، زمانی که اینجا تم رو ست کنیم روی تمام text field های اپ تاثیر میزاره.
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.pinkColor)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.pinkColor)
            ),
          ),
          // تم دکمه های برنامه
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(AppColors.pinkColor),
              minimumSize: const MaterialStatePropertyAll(Size(double.infinity,50))
            )
          )
        ),
        //مشخص کردن ادرس صفحات برنامه برای عملیات مسیر یابی
        getPages: [
          GetPage(name: RoutePages.addOrEditPageRoute, page: () => const AddOrEditTodoScreen())
        ],
        home: const HomeScreen()
    );
  }
}