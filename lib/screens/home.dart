import 'package:first_laboratory_exercise/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_details_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.index});

  final String title;
  final String index;

  List<Exam> get exams => [
    Exam(
      subjectName: "Дискретна математика",
      time: DateTime(2025, 1, 10, 9, 0),
      rooms: ["A1", "A2"],
    ),
    Exam(
      subjectName: "Вовед во наука за податоци",
      time: DateTime(2025, 1, 12, 12, 30),
      rooms: ["B1"],
    ),
    Exam(
      subjectName: "Бази на податоци",
      time: DateTime(2025, 1, 15, 10, 0),
      rooms: ["C3", "C4"],
    ),
    Exam(
      subjectName: "Веб програмирање",
      time: DateTime(2024, 12, 20, 14, 0),
      rooms: ["Lab1"],
    ),
    Exam(
      subjectName: "Оперативни системи",
      time: DateTime(2025, 2, 5, 11, 0),
      rooms: ["D2"],
    ),
    Exam(
      subjectName: "Алгоритми и податочни структури",
      time: DateTime(2024, 12, 25, 10, 0),
      rooms: ["A1"],
    ),
    Exam(
      subjectName: "Информациска безбедности",
      time: DateTime(2025, 2, 8, 13, 30),
      rooms: ["E5"],
    ),
    Exam(
      subjectName: "Компјутерски мрежи и безбедност",
      time: DateTime(2025, 2, 15, 9, 30),
      rooms: ["F2"],
    ),
    Exam(
      subjectName: "Мобилни информациски системи",
      time: DateTime(2025, 3, 1, 10, 0),
      rooms: ["Lab2"],
    ),
    Exam(
      subjectName: "Вештачка интелигенција",
      time: DateTime(2025, 12, 10, 11, 30),
      rooms: ["АI Room"],
    ),
    Exam(
      subjectName: "Дигитална форензика",
      time: DateTime(2025, 12, 8, 11, 30),
      rooms: ["Lab 13"],
    ),
  ];

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final sortedExams = List<Exam>.from(widget.exams)
      ..sort((a, b) => a.time.compareTo(b.time));

    return Scaffold(
      appBar: CustomAppBar(
          title: "${widget.title} - ${widget.index}"
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: sortedExams.length,
              itemBuilder: (context, index) {
                final exam = sortedExams[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ExamDetailsScreen(exam: exam),
                      ),
                    );
                  },
                  child: ExamCard(exam: exam),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            child: Chip(
              label: Text("Вкупно испити: ${sortedExams.length}"),
              backgroundColor: Color.fromRGBO(215, 227, 252, 1),
              side: BorderSide.none,
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
