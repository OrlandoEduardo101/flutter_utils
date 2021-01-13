import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'card_product_controller.g.dart';

@Injectable()
class CardProductController = _CardProductControllerBase
    with _$CardProductController;

abstract class _CardProductControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
