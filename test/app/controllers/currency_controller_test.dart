import 'package:curso_flutterando/app/controllers/currency_controller.dart';
import 'package:curso_flutterando/app/models/currency_model.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final currencies = Currency.getCurrencies();
  final realCurrency = currencies[0];
  final dollarCurrency = currencies[1];

  test('it should convert from real to dollar', () {
    final currencyController = CurrencyController();
    
    currencyController.fromCurrency = realCurrency;
    currencyController.toCurrency = dollarCurrency;
    currencyController.fromCurrencyField.text = '20';
    
    currencyController.convert();

    final convertedValue = currencyController.toCurrencyField.text;
    expect(convertedValue, '3.60');
  });

  test('it should convert from dollar to real', () {
    final currencyController = CurrencyController();

    currencyController.fromCurrency = dollarCurrency;
    currencyController.toCurrency = realCurrency;
    currencyController.fromCurrencyField.text = '20';

    currencyController.convert();

    final convertedValue = currencyController.toCurrencyField.text;
    expect(convertedValue, '112.60');
  });
}