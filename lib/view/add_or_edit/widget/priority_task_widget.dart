import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app_flutter/constants/colors/app_colors.dart';

class PriorityTask extends StatelessWidget {
   PriorityTask({required this.title,required this.selected,required this.onTap,Key? key}) : super(key: key);
  final String title;
  final bool selected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
            if(selected)
            Icon(Icons.check,size: 18,color: AppColors.lightYellowColor),
            const SizedBox(width: 6),
            Text(title,style: const TextStyle(fontFamily: "Dirooz"),)
          ],
        ),
      ),
    );
  }
}
