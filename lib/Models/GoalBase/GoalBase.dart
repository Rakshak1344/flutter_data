import '../export.dart';
import 'Adapters/GoalBaseAdapter.dart';
import 'Transaction.dart';


@JsonSerializable()
@DataRepository([GoalBaseAdapter])
class GoalBase with DataModel<GoalBase> {
  @override
  final String? id;
  final DateTime startDate;
  final bool? isComplete;
  final String goalName;
  final int amount;
  final DateTime endDate;
  final HasMany<Transaction>? transactions;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  GoalBase({
    required this.startDate,
    this.isComplete,
    this.id,
    required this.goalName,
    required this.amount,
    required this.endDate,
    this.transactions,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Map<String, dynamic> toJson() => {
        "goalName": goalName,
        "amount": amount,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String()
  };
}
