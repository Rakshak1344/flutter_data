import '../../export.dart';

mixin TaskAdapter<T extends DataModel<T>> on RemoteAdapter<T> {
  @override
  String get baseUrl => 'https://my-json-server.typicode.com/flutterdata/demo/';

  @override
  String urlForFindAll(Map<String, dynamic> params) => 'todos/all';
}
