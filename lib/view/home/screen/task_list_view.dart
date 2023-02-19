import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_flutter/controller/data_base/data_base_controller.dart';
import 'package:todo_app_flutter/model/priority/priority_model.dart';
import 'package:todo_app_flutter/model/task/task_model.dart';
import 'package:todo_app_flutter/view/home/widgets/todo_item_widget.dart';
import '../widgets/empty_state.dart';

class TaskListView extends StatelessWidget {
   TaskListView({required this.priority,Key? key}) : super(key: key);
   //controller
  final HiveDataBaseController dbController = Get.find<HiveDataBaseController>();
  final PriorityModel priority;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder( // این ویجت به یک مقدار گوش میده و در صورت تغیر اون مقدار صفحه رو اپدیت میکنه
      valueListenable: dbController.box.listenable(),
      builder: (context, box, child) {

        // در این بخش با چک کردن وضعیت هر صفحه داده های مناسب اون صفحه رو جدا و نمایش میدیم
        List<TaskModel> items;
        switch (priority) {
          case PriorityModel.low :
            //where => کل ایتم های دیتابیس رو پیمایش میکنه و اون بخشی که شامل شرط مشخص شده باشه رو برمیگردونه
            items = box.values.where((TaskModel taskItem) => taskItem.priority == PriorityModel.low).toList();
            break;
          case PriorityModel.normal :
            items = box.values.where((TaskModel taskItem) => taskItem.priority == PriorityModel.normal).toList();
            break;
          case PriorityModel.height :
            items = box.values.where((TaskModel taskItem) => taskItem.priority == PriorityModel.height).toList();
        }

        // EmptyState صورتی که دیتابیس خالی نباشه ایتم ها رو نمایش میدیم و در صورتی که خالی باشه
        if(items.isNotEmpty){
          return ListView.builder(
            padding: const EdgeInsets.only(top: 16, bottom: 86),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return todoItemWidget(context, items[index]);
            },
          );
        } else{
          return const EmptyState();
        }

      });
  }
}
