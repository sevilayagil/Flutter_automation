import 'package:flutter_driver/flutter_driver.dart';

class HomePage {
  final counterTextFinder = find.byValueKey('counterText');
  final buttonFinder = find.byTooltip('increment');
  final buttonAdd = find.byValueKey('add');
  final buttonSubtract = find.byValueKey('subtract');
  final alertText = find.byValueKey('alert_text');
  final btnClose = find.byValueKey('close_button');
  final textBoxName = find.byValueKey('inputKey');

  FlutterDriver _driver;
  //Constructor
  HomePage(FlutterDriver driver) {
    this._driver = driver;
  }
  Future<String> getCounterValue() async {
    return await _driver.getText(counterTextFinder);
  }
}
