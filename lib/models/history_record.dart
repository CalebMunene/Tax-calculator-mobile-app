class HistoryRecord {
  final int id;
  final String type; // 'EMI' or 'Tax'
  final String details;
  final String result;
  final DateTime date;

  HistoryRecord({required this.id, required this.type, required this.details, required this.result, required this.date});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'details': details,
      'result': result,
      'date': date.toIso8601String(),
    };
  }

  static HistoryRecord fromMap(Map<String, dynamic> map) {
    return HistoryRecord(
      id: map['id'],
      type: map['type'],
      details: map['details'],
      result: map['result'],
      date: DateTime.parse(map['date']),
    );
  }
}
