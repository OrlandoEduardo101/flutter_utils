import 'package:rx_notifier/rx_notifier.dart';

class AppStore {
  final counter = RxNotifier(0);

  increment() {
    counter.value++;
  }
}
