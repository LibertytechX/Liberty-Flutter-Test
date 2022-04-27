class RemoteException implements Exception {
  final String message;

  RemoteException({required this.message});
}

class LocalException implements Exception {
  final String message;

  LocalException({required this.message});
}

class SharedPreferencesException implements Exception {}