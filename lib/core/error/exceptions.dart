class ServerExcaption implements Exception {
  String message;
  ServerExcaption({this.message});
}

class CacheException implements Exception {}
