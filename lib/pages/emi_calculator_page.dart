import 'package:flutter/material.dart';
import 'dart:math'; // Import the dart:math library

class EmiCalculatorPage extends StatefulWidget {
  const EmiCalculatorPage({super.key});

  @override
  _EmiCalculatorPageState createState() => _EmiCalculatorPageState();
}

class _EmiCalculatorPageState extends State<EmiCalculatorPage> {
  final _principalController = TextEditingController();
  final _interestController = TextEditingController();
  final _tenureController = TextEditingController();
  double _emiResult = 0;

  void _calculateEmi() {
    double principal = double.parse(_principalController.text);
    double interest = double.parse(_interestController.text) / 12 / 100;
    int tenure = int.parse(_tenureController.text);

    // Use the pow function from dart:math
    double emi = (principal * interest * pow(1 + interest, tenure)) /
        (pow(1 + interest, tenure) - 1);

    setState(() {
      _emiResult = emi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _principalController,
              decoration: InputDecoration(labelText: 'Principal Amount'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _interestController,
              decoration: InputDecoration(labelText: 'Interest Rate (%)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _tenureController,
              decoration: InputDecoration(labelText: 'Tenure (Months)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateEmi,
              child: Text('Calculate EMI'),
            ),
            SizedBox(height: 20),
            Text('Your Monthly EMI is: $_emiResult'),
          ],
        ),
      ),
    );
  }
}
