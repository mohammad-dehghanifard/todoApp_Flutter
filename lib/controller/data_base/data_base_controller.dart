import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_flutter/constants/app_keys/app_keys.dart';
import 'package:todo_app_flutter/model/priority/priority_model.dart';
import 'package:todo_app_flutter/model/task/task_model.dart';

class HiveDataBaseController extends GetxController{

 Rx<PriorityModel> taskPriority = PriorityModel.low.obs;
 late TaskModel task;
 var box = Hive.box<TaskModel>(AppKey.todoBoxKey).obs;

 final TextEditingController taskTitleTextFieldController = TextEditingController();
 final TextEditingController descriptionTextFieldController = TextEditingController();

saveOrEditTask(){}
deleteTask(){}
}