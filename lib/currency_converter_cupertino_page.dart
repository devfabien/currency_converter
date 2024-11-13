import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState
    extends State<CurrencyConverterCupertinoPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convertCurrency() {
    result = double.parse(textEditingController.text) * 1365;
    setState(() {});
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        middle: Text(
          'Currency Converter',
          style: TextStyle(
              color: CupertinoColors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${result != 0 ? result.toStringAsFixed(2) : 0} frw',
                style: const TextStyle(
                    fontSize: 46,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
              CupertinoTextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: CupertinoColors.black,
                ),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                placeholder: 'Please enter the amount in USD',
                prefix: const Icon(
                  CupertinoIcons.money_dollar,
                  color: CupertinoColors.systemGrey,
                ),
                // decoration: InputDecoration(
                //   hintText: 'Please enter the amountt in USD',
                //   hintStyle: const TextStyle(
                //     color: CupertinoColors.black,
                //   ),
                //   prefixIcon: const Icon(
                //     Icons.monetization_on_outlined,
                //   ),
                //   prefixIconColor: Colors.black,
                //   filled: true,
                //   fillColor: Colors.white,
                //   focusedBorder: border.copyWith(
                //     borderSide: const BorderSide(
                //       color: Colors.blue,
                //       width: 2.0,
                //       style: BorderStyle.solid,
                //     ),
                //   ),
                //   enabledBorder: border,
                // ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(height: 10),
              CupertinoButton(
                onPressed: convertCurrency,
                color: CupertinoColors.black,
                child: const Text('Convert'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
