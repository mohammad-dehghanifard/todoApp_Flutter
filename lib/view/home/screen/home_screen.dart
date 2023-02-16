import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_flutter/constants/colors/app_colors.dart';
import 'package:todo_app_flutter/constants/routes/routs_pages.dart';
import 'package:todo_app_flutter/controller/data_base/data_base_controller.dart';
import 'package:todo_app_flutter/model/task/task_model.dart';
import 'package:todo_app_flutter/view/home/widgets/todo_item_widget.dart';

class HomeScreen extends StatelessWidget {
   const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final HiveDataBaseController dbController = Get.find<HiveDataBaseController>();

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18,24,18,0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                    "کاربر عزیز خوش آمدید!",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Dirooz"
                  ),
                ),
                TextButton(
                    onPressed: () => dbController.deleteAllTask(),
                    style: ButtonStyle(
                      overlayColor: MaterialStatePropertyAll(AppColors.lightYellowColor.withOpacity(0.2))
                    ),
                    child: Text("حذف تمام کارها",style: TextStyle(fontFamily: "Dirooz",fontWeight: FontWeight.bold,color: AppColors.lightYellowColor),))
              ],
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: dbController.box.listenable(),
              builder: (context, box, child) {
                var items = box.values.toList();
                return ListView.builder(
                  padding: const EdgeInsets.only(top: 16, bottom: 86),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return todoItemWidget(context, items[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
