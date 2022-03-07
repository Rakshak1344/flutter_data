import 'package:flutterdata/Config/Config.dart';
import 'package:flutterdata/Models/export.dart';

mixin BaseAdapter<T extends DataModel<T>> on RemoteAdapter<T> {
  @override
  String get baseUrl => Config.baseURL;
}
