import 'package:get/get.dart';
import 'package:todo_app_flutter/controller/data_base/data_base_controller.dart';

class BindingControllers implements Bindings{

  @override
  void dependencies() {
    Get.put(HiveDataBaseController());
  }
}