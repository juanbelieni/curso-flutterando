import 'package:curso_flutterando/app/components/currency_field_component.dart';
import 'package:curso_flutterando/app/components/drawer_component.dart';
import 'package:curso_flutterando/app/controllers/currency_controller.dart';
import 'package:flutter/material.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({Key? key}) : super(key: key);

  @override
  _ConverterPageState createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  final currencyController = CurrencyController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Converter'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Container(
          width: 480,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: Image.asset('assets/images/currency.png'),
              ),
              SizedBox(height: 30),
              CurrencyField(
                textFieldController: currencyController.fromCurrencyField,
                currencyValue: currencyController.fromCurrency,
                currencies: currencyController.currencies,
                onCurrencyChanged: (value) {
                  setState(() {
                    currencyController.fromCurrency = value;
                  });
                },
              ),
              SizedBox(height: 10),
              CurrencyField(
                textFieldController: currencyController.toCurrencyField,
                currencyValue: currencyController.toCurrency,
                currencies: currencyController.currencies,
                onCurrencyChanged: (value) {
                  setState(() {
                    currencyController.toCurrency = value;
                  });
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  currencyController.convert();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber[700],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Text('Convert'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
