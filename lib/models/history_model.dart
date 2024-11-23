class HistoryItem {
  final String equation;
  final String result;
  final String time;

  HistoryItem({
    required this.equation,
    required this.result,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'equation': equation,
      'result': result,
      'time': time,
    };
  }

  factory HistoryItem.fromMap(Map<String, dynamic> map) {
    return HistoryItem(
      equation: map['equation'],
      result: map['result'],
      time: map['time'],
    );
  }
}
