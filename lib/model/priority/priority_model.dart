import 'package:hive/hive.dart';

part 'priority_model.g.dart';

@HiveType(typeId: 2)
enum PriorityModel{
  @HiveField(0)
  low,
  @HiveField(1)
  normal,
  @HiveField(2)
  height,
}