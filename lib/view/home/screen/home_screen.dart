import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_flutter/constants/colors/app_colors.dart';
import 'package:todo_app_flutter/view/add_or_edit/add_or_edit_screen.dart';
import 'package:todo_app_flutter/view/home/widgets/todo_item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
        onPressed: () {Get.to(AddOrEditTodoScreen());},
        backgroundColor: AppColors.lightYellowColor,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 32,bottom: 86),
        itemCount: 15,
        itemBuilder: (context, index) {
        return todoItemWidget(context);
      },)
    );
  }


}
