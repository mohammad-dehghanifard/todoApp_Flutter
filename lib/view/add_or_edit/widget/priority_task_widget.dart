import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app_flutter/constants/colors/app_colors.dart';

class PriorityTask extends StatelessWidget {
  const PriorityTask({required this.title,Key? key}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Container(
        width: 110,
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightYellowColor,width: 1),
            borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          children: [
            const Icon(Icons.check,size: 18,color: Colors.black),
            const SizedBox(width: 6),
            Text(title,style: const TextStyle(fontFamily: "Dirooz"),)
          ],
        ),
      ),
    );
  }
}
