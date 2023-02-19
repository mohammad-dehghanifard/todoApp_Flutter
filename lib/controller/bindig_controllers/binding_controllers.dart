import 'package:get/get.dart';
import 'package:todo_app_flutter/controller/data_base/data_base_controller.dart';

// تمام کنترلر های برنامه رو داخل این کلاس ایجاد و در بخش های مختلف برنامه با Get.find بهشون دسترسی پیدا میکنیم
class BindingControllers implements Bindings{

  @override
  void dependencies() {
    Get.put(HiveDataBaseController());
  }
}