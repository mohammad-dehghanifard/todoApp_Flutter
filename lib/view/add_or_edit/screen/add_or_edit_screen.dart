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
  HiveDataBaseController controller = Get.put(HiveDataBaseController());
  @override
  void initState() {
    controller.task = Get.arguments;
    controller.taskTitleTextFieldController.text = controller.task.title;
    controller.descriptionTextFieldController.text = controller.task.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text("Add Todo"),
        centerTitle: true,
        backgroundColor: AppColors.lightYellowColor,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16,64,16,8),
        child: Column(
          children:  [
             TextField(
               controller: controller.taskTitleTextFieldController,
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
              controller: controller.descriptionTextFieldController,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: "توضیحات....",
                hintStyle: const TextStyle(fontSize: 14,fontFamily: 'Dirooz')
              ),
            ),
            const SizedBox(height: 12),
            Obx(
              ()=> Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  PriorityTask(
                      title: "عادی",
                      selected: controller.taskPriority.value == PriorityModel.low,
                      onTap: () => controller.taskPriority.value = PriorityModel.low,
                  ),
                  PriorityTask(
                      title: "معمولی",
                      selected: controller.taskPriority.value == PriorityModel.normal,
                      onTap: () => controller.taskPriority.value = PriorityModel.normal,
                  ),
                  PriorityTask(
                      title: "مهم",
                      selected: controller.taskPriority.value == PriorityModel.height,
                      onTap: () => controller.taskPriority.value = PriorityModel.height,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  controller.addOrEditTask();
                  },
                child: const Text("اضافه کردن",style: TextStyle(fontSize: 20,fontFamily: "Dirooz"),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
