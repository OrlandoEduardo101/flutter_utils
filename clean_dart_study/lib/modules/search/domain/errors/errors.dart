abstract class IFailureSearch implements Exception {
  
}

class InvalidTextError implements IFailureSearch {}

class DataSourceError implements IFailureSearch {
  final String message;

  DataSourceError({this.message});
}
