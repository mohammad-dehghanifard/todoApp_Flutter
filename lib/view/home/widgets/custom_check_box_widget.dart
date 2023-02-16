// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants/colors/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
  final bool taskDone;
  Function() onTap;
  CustomCheckBox({required this.taskDone,required this.onTap,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.lightYellowColor),
          color: taskDone ? AppColors.lightYellowColor  : null,
        ),
        child: taskDone? const Icon(Icons.check,size: 18,color: Colors.white) : null,
      ),
    );
  }
}