import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_flutter/common/constants/colors/app_colors.dart';

Future<dynamic> customAwesomeDialog(
    {
      required BuildContext context,
      required DialogType dialogType,
      required String title,
      required String description,
      required String okBtnTxt,
      required String cancelBtnTxt,
      required Function() onTapOk,
      required Function() onTapCancel,
    }
    ){
  return AwesomeDialog(
    context: context,
    headerAnimationLoop: false,
    dialogType: dialogType,
    animType: AnimType.topSlide,
    padding: const EdgeInsets.all(8),
    title: title,
    titleTextStyle: TextStyle(fontSize: 16,color: AppColors.textColor,fontWeight: FontWeight.bold,fontFamily: 'Dirooz'),
    desc: description,
    descTextStyle: TextStyle(fontSize: 14,color: AppColors.textColor,fontFamily: 'Dirooz'),
    btnOkText: okBtnTxt,
    btnCancelText: cancelBtnTxt,
    btnOkOnPress: onTapOk,
    btnCancelOnPress: onTapCancel,
  ).show();
}
