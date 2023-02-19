import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_flutter/common/constants/app_keys/app_keys.dart';
import 'package:todo_app_flutter/model/priority/priority_model.dart';
import 'package:todo_app_flutter/model/task/task_model.dart';
import 'package:todo_app_flutter/view/main/main_screen.dart';

void main() async {
  // تنظیمات اولیه Hive
  await Hive.initFlutter();
  // کلاس اداپتر ها بعد از زدن دستور جنریت به صورت خودکار ایجاد میشن
  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(PriorityModelAdapter());
  await Hive.openBox<TaskModel>(AppKey.todoBoxKey);
  runApp(const MainScreen());
}


