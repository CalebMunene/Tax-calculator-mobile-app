import 'package:flutter/material.dart';
import 'package:flutter_project/services/database_helper.dart';
import 'package:flutter_project/models/history_record.dart';

class TaxCalculatorPage extends StatefulWidget {
  @override
  _TaxCalculatorPageState createState() => _TaxCalculatorPageState();
}

class _TaxCalculatorPageState extends State<TaxCalculatorPage> {
  final _incomeController = TextEditingController();
  double _taxResult = 0;
  final _databaseHelper = DatabaseHelper();

  void _calculateTax() {
    double income = double.parse(_incomeController.text);

    // Example tax calculation (simple slab)
    if (income <= 250000) {
      _taxResult = 0;
    } else if (income <= 500000) {
      _taxResult = (income - 250000) * 0.05;
    } else if (income <= 1000000) {
      _taxResult = 12500 + (income - 500000) * 0.2;
    } else {
      _taxResult = 112500 + (income - 1000000) * 0.3;
    }

    setState(() {
      _taxResult = _taxResult;
    });

    // Save to history
    HistoryRecord record = HistoryRecord(
      id: 0,
      type: 'Tax',
      details: 'Income: $income',
      result: _taxResult.toStringAsFixed(2),
      date: DateTime.now(),
    );
    _databaseHelper.insertHistoryRecord(record);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tax Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _incomeController,
              decoration: InputDecoration(labelText: 'Annual Income'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateTax,
              child: Text('Calculate Tax'),
            ),
            SizedBox(height: 20),
            Text('Your Payable Tax is: $_taxResult'),
          ],
        ),
      ),
    );
  }
}
