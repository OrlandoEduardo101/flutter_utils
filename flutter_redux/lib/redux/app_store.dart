import 'package:flutter_redux/redux/store.dart';

import 'app_state.dart';

enum AppAction {increment, decrement }

AppState _reducer(AppState state, AppAction action) {
  if (action == AppAction.increment) {
    //return AppState(value: state.value + 1);
    return state + 1;
  } else {
    return state - 1;
  }
}

final appStore = Store<AppAction, AppState>(initialState: AppState(), reducer: _reducer);
