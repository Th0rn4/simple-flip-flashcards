import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_flash_card_app/Models/Flashcard.dart';

class FlashcardStorage {
  static const _flashcardsKey = 'flashcards';

  Future<void> saveFlashcards(List<Flashcard> flashcards) async {
    final prefs = await SharedPreferences.getInstance();
    final flashcardsJson = flashcards.map((fc) => jsonEncode(fc.toJson())).toList();
    await prefs.setStringList(_flashcardsKey, flashcardsJson);
  }

  Future<List<Flashcard>> loadFlashcards() async {
    final prefs = await SharedPreferences.getInstance();
    final flashcardsJson = prefs.getStringList(_flashcardsKey) ?? [];
    return flashcardsJson.map((fcJson) => Flashcard.fromJson(jsonDecode(fcJson))).toList();
  }
}
