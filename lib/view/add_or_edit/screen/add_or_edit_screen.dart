import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_app_flutter/constants/colors/app_colors.dart';
import 'package:todo_app_flutter/controller/data_base/data_base_controller.dart';
import 'package:todo_app_flutter/model/priority/priority_model.dart';
import 'package:todo_app_flutter/view/add_or_edit/widget/priority_task_widget.dart';

class AddOrEditTodoScreen extends StatefulWidget {
  const AddOrEditTodoScreen({Key? key}) : super(key: key);

  @override
  State<AddOrEditTodoScreen> createState() => _AddOrEditTodoScreenState();
}

class _AddOrEditTodoScreenState extends State<AddOrEditTodoScreen> {
  final HiveDataBaseController dbController = Get.find<HiveDataBaseController>();
  @override
  void initState() {
    dbController.task = Get.arguments;
    dbController.taskTitleTextFieldController.text = dbController.task.title;
    dbController.descriptionTextFieldController.text = dbController.task.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(dbController.task.title == ''? "Add Todo" : "Edit Task"),
        centerTitle: true,
        backgroundColor: AppColors.lightYellowColor,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16,64,16,8),
        child: Column(
          children:  [
             TextField(
               controller: dbController.taskTitleTextFieldController,
              style: const TextStyle(color: Colors.white,fontFamily: "Dirooz"),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.lightYellowColor,
                hintText: "عنوان را وارد کنید",
                hintStyle: const TextStyle(fontSize: 14,color: Colors.white,fontFamily: 'Dirooz')
              ),
            ),
            const SizedBox(height: 16),
             TextField(
              controller: dbController.descriptionTextFieldController,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: "توضیحات....",
                hintStyle: TextStyle(fontSize: 14,fontFamily: 'Dirooz')
              ),
            ),
            const SizedBox(height: 12),
            Obx(
              ()=> Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  PriorityTask(
                      title: "عادی",
                      selected: dbController.taskPriority.value == PriorityModel.low,
                      onTap: () => dbController.taskPriority.value = PriorityModel.low,
                  ),
                  PriorityTask(
                      title: "معمولی",
                      selected: dbController.taskPriority.value == PriorityModel.normal,
                      onTap: () => dbController.taskPriority.value = PriorityModel.normal,
                  ),
                  PriorityTask(
                      title: "مهم",
                      selected: dbController.taskPriority.value == PriorityModel.height,
                      onTap: () => dbController.taskPriority.value = PriorityModel.height,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => dbController.addOrEditTask(),
                child:  Text(dbController.task.title == "" ?"اضافه کردن" : "ویرایش",style: const TextStyle(fontSize: 20,fontFamily: "Dirooz"),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
