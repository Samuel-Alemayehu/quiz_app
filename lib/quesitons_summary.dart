import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.questionsSummary, {super.key});

  final List<Map<String, Object>> questionsSummary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: questionsSummary.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    color: data['chosen_answer'] == data['correct_answer']
                        ? const Color.fromARGB(255, 89, 180, 201)
                        : const Color.fromARGB(255, 171, 105, 213),
                    child: Text(
                      ((data['index'] as int) + 1).toString(),
                      style: GoogleFonts.lato(
                        color: const Color.fromARGB(255, 49, 47, 52),
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                        // backgroundColor: Colors.amber,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 237, 223, 255),
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['chosen_answer'] as String,
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 233, 156, 248),
                          ),
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 176, 238, 218),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
