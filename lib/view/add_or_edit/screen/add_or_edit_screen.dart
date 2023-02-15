import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants/colors/app_colors.dart';
import 'package:todo_app_flutter/view/add_or_edit/widget/priority_task_widget.dart';

class AddOrEditTodoScreen extends StatelessWidget {
  const AddOrEditTodoScreen({Key? key}) : super(key: key);

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
              decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.lightYellowColor,
                hintText: "عنوان را وارد کنید",
                hintStyle: const TextStyle(fontSize: 14,color: Colors.white,fontFamily: 'Dirooz')
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "توضیحات....",
                hintStyle: const TextStyle(fontSize: 14,fontFamily: 'Dirooz')
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                PriorityTask(title: "عادی"),
                PriorityTask(title: "معمولی"),
                PriorityTask(title: "مهم"),
              ],
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("اضافه کردن",style: TextStyle(fontSize: 20,fontFamily: "Dirooz"),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
