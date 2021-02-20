// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import '../test_driver/pages/home_page.dart';

void main() {
  group('Counter App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    HomePage homePage = HomePage(driver);

    test('Flutter Driver Durum Kontrol', () async {
      Health health = await driver.checkHealth();
      print(health.status);
    });
    test('Mama Miktarı Arttır', () async {
      // First, tap the button.
      await driver.tap(homePage.buttonFinder).then((value) async {
        expect(await driver.getText(homePage.counterTextFinder), "1");
        print('Buttona bir kez tıklandı mama miktarı 1 oldu');
      });
      // Then, verify the counter text is incremented by 1.
      await driver.tap(homePage.buttonFinder).then((value) async {
        expect(await driver.getText(homePage.counterTextFinder), "2");
        print('Buttona bir kez  daha tıklandı mama miktari 2 oldu');
      });
    });
    test('Mevcut mama miktarı alert kontrol', () async {
      await driver.tap(homePage.buttonAdd).then((value) async {
        expect(
            await driver.getText(homePage.alertText), "Mevcut mama sayisi :2");
        print('Mevcut mama sayisi 2 oldu');
      });
    });

    test('Mama Miktarı Azalt', () async {
      await driver.tap(homePage.btnClose).then((value) async {
        await driver.tap(homePage.buttonSubtract).then((value) async {
          expect(await driver.getText(homePage.counterTextFinder), "1");
          print('Mama azalta 1 kez tıklandı mama sayısı 1 azaldı');
        });
      });
    });
    test('Textbox Girilen Isim Kontrol', () async {
      await driver.tap(homePage.textBoxName).then((value) async {
        await driver.enterText('Sevilay').then((value) async {
          await driver.waitFor(find.text('Sevilay'));
          print('Girilen isim kontrol edildi');
        });
      });
    });
  });
}
