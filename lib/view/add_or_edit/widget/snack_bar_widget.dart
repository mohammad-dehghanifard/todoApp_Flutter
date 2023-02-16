import 'package:flutter/material.dart';
import 'package:get/get.dart';

 showSnackBar({required String title,required String content,required Color color}){
   Get.snackbar(
       title,
       content,
        backgroundColor: color,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(12),
        colorText: Colors.white
   );
}