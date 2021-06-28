import 'package:curso_flutterando/app/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyField extends StatefulWidget {
  final Currency currencyValue;
  final ValueChanged<Currency> onCurrencyChanged;
  final List<Currency> currencies;
  final TextEditingController textFieldController;

  const CurrencyField({
    Key? key,
    required this.currencyValue,
    required this.onCurrencyChanged,
    required this.currencies,
    required this.textFieldController,
  }) : super(key: key);

  @override
  _CurrencyFieldState createState() => _CurrencyFieldState();
}

class _CurrencyFieldState extends State<CurrencyField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 56,
            child: DropdownButton(
              iconEnabledColor: Colors.amber,
              isExpanded: true,
              underline: Container(
                height: 1,
                color: Colors.amber,
              ),
              value: widget.currencyValue,
              onChanged: (Currency? value) => widget.onCurrencyChanged(value!),
              items: widget.currencies
                  .map(
                    (currency) =>
                    DropdownMenuItem(
                      child: Text(currency.name),
                      value: currency,
                    ),
              )
                  .toList(),
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          flex: 3,
          child: TextField(
            controller: widget.textFieldController,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^\d+(?:\.\d{0,2})?')),
            ], //
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.amber,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
