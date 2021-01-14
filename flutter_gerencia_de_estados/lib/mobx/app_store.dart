import 'package:mobx/mobx.dart';

class AppStore {

  AppStore(){
    increment = Action(_increment);
  }
  final counter = Observable<int>(0);

  Action increment;

  _increment() {
    counter.value++;
  }
}
