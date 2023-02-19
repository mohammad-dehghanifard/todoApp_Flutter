import 'package:hive/hive.dart';
import 'package:todo_app_flutter/model/priority/priority_model.dart';

part "task_model.g.dart";

@HiveType(typeId: 1) // از اونجا که hive نوع داده مدل های ما رو نمیشناسه باید به این صورت مدل خودمون رو بهش معرفی کنیم
class TaskModel extends HiveObject{ //HiveObject => با ارث بری از این کلاس به یک سری قابلیت دسترسی پیدا میکنیم که کار ما رو راحتر میکنه
  @HiveField(0) //  شماره index ویژگی های مدل داخل box دیتابیس رو به این صورت مشخص میکنیم
  String title = '';
  @HiveField(1)
  String description = '';
  @HiveField(2)
  bool isDone = false;
  @HiveField(3)
  PriorityModel priority = PriorityModel.low;
}

