class Exam {
  final String subjectName;
  final DateTime time;
  final List<String> rooms;

  Exam({
    required this.subjectName,
    required this.time,
    required this.rooms,
  });

  factory Exam.fromJson(Map<String, dynamic> data) {
    final subject = data['subjectName'] ?? '';
    return Exam(
      subjectName: subject.isNotEmpty
          ? subject[0].toUpperCase() + subject.substring(1)
          : subject,
      time: DateTime.parse(data['time']),
      rooms: List<String>.from(data['rooms']),
    );
  }

  Map<String, dynamic> toJson() => {
    'subjectName': subjectName,
    'time': time.toIso8601String(),
    'rooms': rooms,
  };
}
