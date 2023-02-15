import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_flutter/constants/app_keys/app_keys.dart';
import 'package:todo_app_flutter/constants/colors/app_colors.dart';
import 'package:todo_app_flutter/controller/data_base/data_base_controller.dart';
import 'package:todo_app_flutter/model/task/task_model.dart';
import 'package:todo_app_flutter/view/add_or_edit/screen/add_or_edit_screen.dart';
import 'package:todo_app_flutter/view/home/widgets/todo_item_widget.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  final HiveDataBaseController controller = Get.put(HiveDataBaseController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO APP"),
        centerTitle: true,
        backgroundColor: AppColors.lightYellowColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {Get.to(const AddOrEditTodoScreen());},
        backgroundColor: AppColors.lightYellowColor,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: Obx(
       () {
         return ListView.builder(
           shrinkWrap: true,
           padding: const EdgeInsets.only(top: 32,bottom: 86),
           itemCount: controller.box.value.values.toList().length,
           itemBuilder: (context, index) {
             return todoItemWidget(context);
           },);
       },
      ),

    );
  }


}
