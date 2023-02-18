import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_flutter/controller/data_base/data_base_controller.dart';
import 'package:todo_app_flutter/model/priority/priority_model.dart';
import 'package:todo_app_flutter/model/task/task_model.dart';
import 'package:todo_app_flutter/view/home/widgets/todo_item_widget.dart';

import '../widgets/empty_state.dart';

class TaskListView extends StatelessWidget {
   TaskListView({required this.priority,Key? key}) : super(key: key);
  final HiveDataBaseController dbController = Get.find<HiveDataBaseController>();
  final PriorityModel priority;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: dbController.box.listenable(),
      builder: (context, box, child) {

        List<TaskModel> items;
        if(box.isNotEmpty){
          switch(priority){
            case PriorityModel.low :
              items = box.values.where((element) => element.priority == PriorityModel.low).toList();
              break;
            case PriorityModel.normal :
              items = box.values.where((element) => element.priority == PriorityModel.normal).toList();
              break;
            case PriorityModel.height :
              items = box.values.where((element) => element.priority == PriorityModel.height).toList();
          }

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
      },
    );
  }
}
