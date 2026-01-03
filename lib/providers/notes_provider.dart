import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/note.dart';
import '../services/notes_service.dart';

class NotesProvider with ChangeNotifier {
  final NotesService _notesService = NotesService();
  final Uuid _uuid = const Uuid();

  List<Note> _notes = [];
  List<Note> get notes => _notes;

  NotesProvider() {
    loadNotes();
  }

  void loadNotes() {
    _notes = _notesService.getAllNotes();
    notifyListeners();
  }

  Future<void> addNote(String title, String content) async {
    final note = Note(
      id: _uuid.v4(),
      title: title,
      content: content,
      createdAt: DateTime.now(),
    );
    await _notesService.addNote(note);
    loadNotes();
  }

  Future<void> updateNote(String id, String title, String content) async {
    final note = Note(
      id: id,
      title: title,
      content: content,
      createdAt: DateTime.now(),
    );
    await _notesService.updateNote(note);
    loadNotes();
  }

  Future<void> deleteNote(String id) async {
    await _notesService.deleteNote(id);
    loadNotes();
  }

  Note? getNoteById(String id) {
    return _notesService.getNoteById(id);
  }
}

