import 'package:flutterdata/Models/GoalBase/GoalBase.dart';
import 'package:flutterdata/Models/export.dart';

class GoalBaseResponse{
  GoalBaseResponse({
    required this.status,
    required this.success,
    required this.data,
  });
  
  int status;
  bool success;
  List<GoalBase> data;
}
