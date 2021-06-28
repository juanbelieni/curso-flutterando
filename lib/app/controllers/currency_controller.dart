import 'package:curso_flutterando/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';

class CurrencyController {
  late List<Currency> currencies;
  late Currency fromCurrency;
  late Currency toCurrency;
  final TextEditingController fromCurrencyField = TextEditingController();
  final TextEditingController toCurrencyField = TextEditingController();


  CurrencyController() {
    currencies = Currency.getCurrencies();
    fromCurrency = currencies[0];
    toCurrency = currencies[1];
  }

  void convert() {
    double value = double.tryParse(fromCurrencyField.text) ?? 0.0;
    double conversionRate = fromCurrency.conversions[toCurrency.name] ?? 0.0;
    double convertedValue = value * conversionRate;

    toCurrencyField.text = convertedValue.toStringAsFixed(2);
  }
}