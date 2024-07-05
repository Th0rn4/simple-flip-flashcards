import 'package:flutter/material.dart';
import 'package:simple_flash_card_app/Models/Flashcard.dart';

class AddFlashcard extends StatefulWidget {
  const AddFlashcard({super.key});

  @override
  _AddFlashcardState createState() => _AddFlashcardState();
}

class _AddFlashcardState extends State<AddFlashcard> {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Flashcard',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Question',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: questionController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[850],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Enter your question',
                hintStyle: TextStyle(color: Colors.white70),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              'Answer',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: answerController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[850],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Enter your answer',
                hintStyle: TextStyle(color: Colors.white70),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final flashcard = Flashcard(
                    question: questionController.text,
                    answer: answerController.text,
                  );
                  Navigator.pop(context, flashcard);
                },
                child: Text('Save Flashcard'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
