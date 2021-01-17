import 'package:flutter_triple/flutter_triple.dart';

class AppStore extends NotifierStore<Exception, int> {
  AppStore() : super(0);

  //final counter = RxNotifier(0);

  Future<void> increment() async {
    setLoading(true);
    await Future.delayed(Duration(milliseconds: 500));

    int value = state + 1;

    try {
      if (value < 10) {
        update(value);
        print(value);
      } else {
        throw Exception('Error: state not can be > 9');
      }
    } catch (e) {
      setError(e);
    }

    setLoading(false);
  }
}
