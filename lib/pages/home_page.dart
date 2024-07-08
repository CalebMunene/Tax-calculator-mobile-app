import 'package:flutter/material.dart';
import 'emi_calculator_page.dart';
import 'tax_calculator_page.dart';
import 'history_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EmiCalculatorPage()),
                );
              },
              child: Text('EMI Calculator'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TaxCalculatorPage()),
                );
              },
              child: Text('Tax Calculator'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryPage()),
                );
              },
              child: Text('History'),
            ),
          ],
        ),
      ),
    );
  }
}
