abstract class ILoginFailure implements Exception {
  final String message;

  ILoginFailure(this.message);

  @override
  String toString() {
    return '${this.runtimeType}: $message';
  }
}

class NotValidParams extends ILoginFailure {
  NotValidParams(String message) : super(message);
}

class DatasourceError extends ILoginFailure {
  DatasourceError(String message) : super(message);
}
