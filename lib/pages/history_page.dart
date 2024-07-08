import 'package:flutter/material.dart';
import 'package:flutter_project/services/database_helper.dart';
import 'package:flutter_project/models/history_record.dart';

class HistoryPage extends StatelessWidget {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: FutureBuilder<List<HistoryRecord>>(
        future: _databaseHelper.getHistoryRecords(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No history records found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final record = snapshot.data![index];
                return ListTile(
                  title: Text(record.type),
                  subtitle: Text(record.details),
                  trailing: Text(record.result),
                  isThreeLine: true,
                );
              },
            );
          }
        },
      ),
    );
  }
}
