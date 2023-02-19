import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_flutter/common/constants/colors/app_colors.dart';
import 'package:todo_app_flutter/common/constants/routes/routs_pages.dart';
import 'package:todo_app_flutter/controller/data_base/data_base_controller.dart';
import 'package:todo_app_flutter/model/priority/priority_model.dart';
import 'package:todo_app_flutter/model/task/task_model.dart';
import 'package:todo_app_flutter/view/home/screen/task_list_view.dart';


class HomeScreen extends StatelessWidget {
   const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // کنترلر دیتابیس
    final HiveDataBaseController dbController = Get.find<HiveDataBaseController>();

    return DefaultTabController(
      length: 3, // مشخص کردن تعداد tab های برنامه
      child: Scaffold(
        appBar: AppBar(
          title: const Text("TODO APP"),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            // عنوان tab های صفحه
            tabs: [
              Text("کم اهمیت",style: TextStyle(fontFamily: "Dirooz",fontSize: 14)),
              Text("نرمال",style: TextStyle(fontFamily: "Dirooz",fontSize: 14)),
              Text("خیلی مهم",style: TextStyle(fontFamily: "Dirooz",fontSize: 14)),
            ],
          ),
          backgroundColor: AppColors.pinkColor,
        ),
        backgroundColor: AppColors.backgroundColor,
        floatingActionButton: FloatingActionButton(
          // در اینجا چون قصد داریم ایتم جدیدی اضافه کنیم به arguments یک مدل خالی رو به صفحه بعد ارسال میکنیم.
          onPressed: () => Get.toNamed(RoutePages.addOrEditPageRoute,arguments: TaskModel()),
          backgroundColor: AppColors.pinkColor,
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18,24,18,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                      "کاربر عزیز خوش آمدید!",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Dirooz"
                    ),
                  ),
                  TextButton(
                      onPressed: () => dbController.deleteAllTask(context),
                      style: ButtonStyle(
                        overlayColor: MaterialStatePropertyAll(AppColors.pinkColor.withOpacity(0.2))
                      ),
                      child: Text("حذف تمام کارها",style: TextStyle(fontFamily: "Dirooz",fontWeight: FontWeight.bold,color: AppColors.pinkColor),))
                ],
              ),
            ),
            Expanded(
              // صفحاتی که قراره داخل هر Tab نمایش داده بشه
              child: TabBarView(
                children: [
                  TaskListView(priority: PriorityModel.low),
                  TaskListView(priority: PriorityModel.normal),
                  TaskListView(priority: PriorityModel.height),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
