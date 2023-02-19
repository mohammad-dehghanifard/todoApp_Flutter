import 'package:hive/hive.dart';

part 'priority_model.g.dart';

@HiveType(typeId: 2)// از اونجا که hive نوع داده مدل های ما رو نمیشناسه باید به این صورت مدل خودمون رو بهش معرفی کنیم
enum PriorityModel{
  @HiveField(0)
  low,
  @HiveField(1)
  normal,
  @HiveField(2)
  height,
}