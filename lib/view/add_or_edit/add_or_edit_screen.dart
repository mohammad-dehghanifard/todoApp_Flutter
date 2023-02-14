import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants/colors/app_colors.dart';

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
              maxLines: 8,
              decoration: InputDecoration(
                hintText: "توضیحات....",
                hintStyle: const TextStyle(fontSize: 14,fontFamily: 'Dirooz')
              ),
            ),
            const SizedBox(height: 16),
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
