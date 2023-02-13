
import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants/colors/app_colors.dart';
import 'package:todo_app_flutter/view/home/widgets/custom_check_box_widget.dart';

Widget todoItemWidget(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    margin: const EdgeInsets.only(bottom: 8),
    width: MediaQuery.of(context).size.width,
    height: 100,
    decoration: BoxDecoration(
        color: AppColors.primaryColor,
        boxShadow: [
          BoxShadow(color: AppColors.textColor.withOpacity(0.2),blurRadius: 10)
        ]
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("عنوان",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.textColor,fontFamily: "LaleZar"),),
              const SizedBox(height: 4),
              Text("متن توضیحات",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.textColor,fontFamily: "LaleZar"),)
            ],
          ),
        ),
        CustomCheckBox(taskDone: true,)
      ],
    ),
  );
}


