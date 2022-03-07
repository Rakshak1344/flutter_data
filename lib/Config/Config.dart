class Config {
  static String scheme = const String.fromEnvironment('SCHEME'); // https
  static String host = const String.fromEnvironment('HOST'); // goalbase.herokuapp.com
  static String hostPrefix = const String.fromEnvironment('HOST_PREFIX'); // api/v1

  static String baseURL =
      "${Config.scheme}://${Config.host}/${Config.hostPrefix}";
}
