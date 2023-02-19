// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:todo_app_flutter/common/constants/colors/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
  final bool taskDone;
  //زمان پیاده سازی مشخص میکنیم که وقتی رو ایتم کلیک شد چه اتفاقی بیفته
  Function() onTap;
  CustomCheckBox({required this.taskDone,required this.onTap,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.pinkColor),
          color: taskDone ? AppColors.pinkColor  : null,
        ),
        child: taskDone? const Icon(Icons.check,size: 18,color: Colors.white) : null,
      ),
    );
  }
}