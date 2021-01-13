class AppState {
  final int value;

  AppState({this.value = 0});

  operator +(int _value) {
    return AppState(value: value + _value);
  }

  operator -(int _value) {
    return AppState(value: value + _value);
  }

  @override
  String toString() {
    return '$value';
  }
}