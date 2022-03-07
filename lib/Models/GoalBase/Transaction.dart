import 'package:flutterdata/Models/GoalBase/Adapters/TransactionAdapter.dart';

import '../export.dart';

@JsonSerializable()
@DataRepository([TransactionAdapter])
class Transaction with DataModel<Transaction> {
  Transaction({
    this.id,
    this.receivedOn,
    required this.amountPaid,
  });

  @override
  final String? id;
  final DateTime? receivedOn;
  final int amountPaid;
}
