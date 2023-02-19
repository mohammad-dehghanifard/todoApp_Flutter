import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_flutter/common/constants/app_keys/app_keys.dart';
import 'package:todo_app_flutter/common/widgets/dialog_widget.dart';
import 'package:todo_app_flutter/model/priority/priority_model.dart';
import 'package:todo_app_flutter/model/task/task_model.dart';
import 'package:todo_app_flutter/view/add_or_edit/widget/snack_bar_widget.dart';

// تمام منطق برنامه رو باید داخل کنترلر ها بنویسیم
class HiveDataBaseController extends GetxController {
  Rx<PriorityModel> taskPriority = PriorityModel.low.obs;
  late TaskModel task; // زمانی که صفحه ادد یا ویرایش ساخته بشه مقدار دهی میشه
  var box = Hive.box<TaskModel>(AppKey.todoBoxKey);
  final TextEditingController taskTitleTextFieldController = TextEditingController();
  final TextEditingController descriptionTextFieldController = TextEditingController();

  //اضافه یا ویرایش کردن ایتم
  addOrEditTask() {
    if (taskTitleTextFieldController.text == '') {
      showSnackBar(
          title: "خطا" ,
          content: "وارد کردن عنوان الزامی میباشد!",
          color: Colors.red
      );

    } else {

      if (task.isInBox) { // در صورتی که ایتم داخل دیتابیس باشه اون ایتم ویرایش میشه و مجدد به دیتابیس اضافه نمیشه
        setModelValue();
        task.save();
        Get.back();
        showSnackBar(
            title: "عملیات موفق" ,
            content: "ایتم مورد نظر با موفقیت اپدیت شد",
            color: Colors.green
        );
      } else { // اگر ایتم تو دیتابیس نباشه به عنوان یک ایتم جدید اضافه میشه
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

  // پرکردن مدل بر اساس اطلاعات ورودی کاربر
  setModelValue() {
    task.title = taskTitleTextFieldController.text;
    task.description = descriptionTextFieldController.text;
    task.priority = taskPriority.value;
  }

  // حذف یک ایتم
  deleteTask(TaskModel taskItem) => taskItem.delete();

  // حذف تمام ایتم های دیتابیس
  deleteAllTask(BuildContext context) {
      if(box.values.isNotEmpty){
        customAwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            title: "هشدار",
            description: "ایا مطمن هستید قصد حذف کردن تمام کارهای خود را دارید؟ کارهای شما بعد از حذف شدن قابل بازیابی نخواهند بود!",
            okBtnTxt: "نه پشیمون شدم",
            cancelBtnTxt: "آره حذفشون کن",
            onTapOk: () {},
            onTapCancel: () {
              box.clear();
            }
        );
      } else{
        showSnackBar(title: "خطا", content: "لیست کارهای شما خالی است!", color: Colors.red);
      }
  }

}
