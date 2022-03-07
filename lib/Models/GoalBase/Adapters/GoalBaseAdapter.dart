import 'dart:convert';

import 'package:flutterdata/Models/GoalBase/GoalBase.dart';

import '../../export.dart';

mixin GoalBaseAdapter on RemoteAdapter<GoalBase> {
  Future<dynamic> fetchAlllGoalBase() async {
    Uri fetcUri = "$baseUrl/goalbase".asUri;

    return await sendRequest(
      fetcUri / 'goalbase.json' & {'v': true},
      method: DataRequestMethod.GET,
      headers: await defaultHeaders,
      onSuccess: (data) => data as String,
      onError: (DataException err) {},
    );
  }
}
// {
      //   Map<String, dynamic> newdata = json.decode(data.toString());
      //   newdata['data'];
      // },