
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_app_flutter/constants/colors/app_colors.dart';
import 'package:todo_app_flutter/constants/routes/routs_pages.dart';
import 'package:todo_app_flutter/controller/data_base/data_base_controller.dart';
import 'package:todo_app_flutter/model/task/task_model.dart';
import 'package:todo_app_flutter/view/home/widgets/custom_check_box_widget.dart';

Widget todoItemWidget(BuildContext context,TaskModel taskItem) {
  final HiveDataBaseController dbController = Get.find<HiveDataBaseController>();
  return GestureDetector(
    onTap: () => Get.toNamed(RoutePages.addOrEditPageRoute,arguments: taskItem),
    onLongPress: () => dbController.deleteTask(taskItem),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.fromLTRB(12,0,12,16),
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: AppColors.textColor.withOpacity(0.2),blurRadius: 10)
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(taskItem.title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: AppColors.textColor,fontFamily: "Dirooz"),),
                const SizedBox(height: 4),
                Text(taskItem.description,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: AppColors.textColor,fontFamily: "Dirooz"),)
              ],
            ),
          ),
          CustomCheckBox(taskDone: taskItem.isDone,onTap: () {
            taskItem.isDone = !taskItem.isDone;
            taskItem.save();
          },)
        ],
      ),
    ),
  );
}


