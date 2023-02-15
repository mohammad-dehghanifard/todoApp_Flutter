import 'package:hive/hive.dart';
import 'package:todo_app_flutter/model/priority/priority_model.dart';

@HiveType(typeId: 1)
class ToDoModel extends HiveObject{
  @HiveField(0)
  String title = '';
  @HiveField(1)
  String description = '';
  @HiveField(2)
  bool isDone = false;
  @HiveField(3)
  PriorityModel priority = PriorityModel.low;
}