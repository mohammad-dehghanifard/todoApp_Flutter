import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_flutter/constants/app_keys/app_keys.dart';
import 'package:todo_app_flutter/model/priority/priority_model.dart';
import 'package:todo_app_flutter/model/task/task_model.dart';
import 'package:todo_app_flutter/view/add_or_edit/widget/snack_bar_widget.dart';

class HiveDataBaseController extends GetxController {
  Rx<PriorityModel> taskPriority = PriorityModel.low.obs;
  late TaskModel task;
  var box = Hive.box<TaskModel>(AppKey.todoBoxKey);
  final TextEditingController taskTitleTextFieldController = TextEditingController();
  final TextEditingController descriptionTextFieldController = TextEditingController();

  addOrEditTask() {
    if (taskTitleTextFieldController.text == '') {
      showSnackBar(
          title: "خطا" ,
          content: "وارد کردن عنوان الزامی میباشد!",
          color: Colors.red
      );

    } else {
      if (task.isInBox) {
        setModelValue();
        task.save();
        Get.back();
        showSnackBar(
            title: "عملیات موفق" ,
            content: "ایتم مورد نظر با موفقیت اپدیت شد",
            color: Colors.green
        );
      } else {
        setModelValue();
        box.add(task);
        Get.back();
        showSnackBar(
            title: "عملیات موفق" ,
            content: "ایتم مورد نظر با موفقیت اضافه شد شد",
            color: Colors.green);
      }
    }
  }

  setModelValue() {
    task.title = taskTitleTextFieldController.text;
    task.description = descriptionTextFieldController.text;
    task.priority = taskPriority.value;
  }

  deleteTask(TaskModel taskItem) => taskItem.delete();

  deleteAllTask() => box.clear();
}
