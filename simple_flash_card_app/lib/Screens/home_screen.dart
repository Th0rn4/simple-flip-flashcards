import 'package:flutter/material.dart';
import 'package:simple_flash_card_app/Components/add_button.dart';
import 'package:simple_flash_card_app/Components/study_tile.dart';
import 'package:simple_flash_card_app/Models/Flashcard.dart';
import 'package:simple_flash_card_app/Screens/add_flashcard_screen.dart';
import 'package:simple_flash_card_app/Services/flashcard_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Flashcard> flashcards = [];
  final FlashcardStorage flashcardStorage = FlashcardStorage();

  @override
  void initState() {
    super.initState();
    _loadFlashcards();
  }

  Future<void> _loadFlashcards() async {
    final loadedFlashcards = await flashcardStorage.loadFlashcards();
    setState(() {
      flashcards = loadedFlashcards;
    });
  }

  Future<void> _addFlashcard(Flashcard flashcard) async {
    setState(() {
      flashcards.add(flashcard);
    });
    await flashcardStorage.saveFlashcards(flashcards);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        itemCount: flashcards.length,
        itemBuilder: (context, index) {
          return Center(
            child: FlashTile(
              question: flashcards[index].question,
              answer: flashcards[index].answer,
            ),
          );
        },
      ),
      floatingActionButton: AddButton(
        onPressed: () async {
          final newFlashcard = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddFlashcard()),
          );

          if (newFlashcard != null) {
            _addFlashcard(newFlashcard);
          }
        },
      ),
    );
  }
}
