import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';
import '../screens/exam_details_screen.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({
    super.key,
    required this.exam,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(exam.time);

    return Card(
      color: Color.fromRGBO(227, 233, 250, 1),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          exam.subjectName,
        ),
        titleTextStyle: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Color.fromRGBO(113, 129, 166, 1),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(
                  Icons.access_time,
                  size: 16,
                  color: Color.fromRGBO(132, 150, 191, 1),
                ),
                const SizedBox(width: 6),
                Text(
                    formattedDate,
                    style: TextStyle(
                      color: Color.fromRGBO(132, 150, 191, 1),
                    ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                    Icons.meeting_room,
                    size: 16,
                    color: Color.fromRGBO(132, 150, 191, 1),
                  ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(exam.rooms.join(', '),
                    style: TextStyle(
                      color: Color.fromRGBO(132, 150, 191, 1),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExamDetailsScreen(exam: exam),
            ),
          );
        },
      ),
    );
  }
}
