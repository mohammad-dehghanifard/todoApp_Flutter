import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_flutter/constants/app_keys/app_keys.dart';
import 'package:todo_app_flutter/constants/colors/app_colors.dart';
import 'package:todo_app_flutter/constants/routes/routs_pages.dart';
import 'package:todo_app_flutter/controller/data_base/data_base_controller.dart';
import 'package:todo_app_flutter/model/task/task_model.dart';
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
        onPressed: () {
          Get.toNamed(RoutePages.addOrEditPageRoute,arguments: TaskModel());
        },
        backgroundColor: AppColors.lightYellowColor,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: ValueListenableBuilder(
        valueListenable: controller.box.listenable(),
        builder: (context, box, child) {
          var items = box.values.toList();
          return ListView.builder(
            padding: const EdgeInsets.only(top: 32, bottom: 86),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return todoItemWidget(context, items[index]);
            },
          );
        },
      ),
    );
  }
}
