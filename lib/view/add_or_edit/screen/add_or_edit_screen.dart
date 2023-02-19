import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_flutter/common/constants/colors/app_colors.dart';
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
    /*
    زمانی که صفحه ایجاد میشه مدل داخل کنترلر رو با مدلی که از صفحه قبل ارسال کردیم پر میکنیم.
    زمانی که روی دکمه ادد داخل صفحه اصلی کلیک بشه مدل خالی ارسال میشه. اما زمانی که رو یکی از ایتم
    کلیک بشه مدل همون ایتم ارسال میشه تا بتونیم اطلاعاتش رو ویرایش کنیم.
     */
    dbController.task = Get.arguments; // Get.arguments => مدلی که از صفحه قبل ارسال کردیم
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
        backgroundColor: AppColors.pinkColor,
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
                  fillColor: AppColors.pinkColor,
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
            Obx( //Obx =>رو انجام میده با این تفاوت که فقط یک بخش خاص رو دوباره میسازه و کل صفحه رو از اول درست نمیکنه setState همون کار
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
                // اضافه یا ویرایش کردن ایتم
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
