import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  double inTemp = 0.0, outTemp = 0.0;
  bool isFahrenheit = true;

  void convertTemperature() {
    setState(() {
      if (isFahrenheit) {
        outTemp = (inTemp - 32) * 5 / 9;
      } else {
        outTemp = inTemp * 9 / 5 + 32;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Temperature Conversion App',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.pink,
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter temperature',
                labelText: isFahrenheit
                    ? 'Enter temperature in Fahrenheit'
                    : 'Enter temperature in Celsius',
                border: const OutlineInputBorder(),
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onChanged: (newValue) {
                setState(() {
                  inTemp = double.tryParse(newValue) ?? 0.0;
                });
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('Fahrenheit'),
                    value: true,
                    groupValue: isFahrenheit,
                    onChanged: (bool? value) {
                      setState(() {
                        isFahrenheit = value ?? true;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('Celsius'),
                    value: false,
                    groupValue: isFahrenheit,
                    onChanged: (bool? value) {
                      setState(() {
                        isFahrenheit = value ?? true;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: convertTemperature,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
              ),
              child: const Text('Convert'),
            ),
            const SizedBox(height: 20),
            Text(
              'Result: ${outTemp.toStringAsFixed(2)} ${isFahrenheit ? '°C' : '°F'}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}