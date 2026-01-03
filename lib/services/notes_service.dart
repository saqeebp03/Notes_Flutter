import 'package:hive/hive.dart';
import '../models/note.dart';

class NotesService {
  static const String notesBoxName = 'notesBox';

  Box<Note> get notesBox => Hive.box<Note>(notesBoxName);

  List<Note> getAllNotes() {
    return notesBox.values.toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt)); // newest first
  }

  Future<void> addNote(Note note) async {
    await notesBox.put(note.id, note);
  }

  Future<void> updateNote(Note note) async {
    await notesBox.put(note.id, note);
  }

  Future<void> deleteNote(String id) async {
    await notesBox.delete(id);
  }

  Note? getNoteById(String id) {
    return notesBox.get(id);
  }
}

