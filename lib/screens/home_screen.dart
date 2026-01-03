import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/notes_provider.dart';
import '../screens/note_edit_screen.dart';
import '../widgets/note_card.dart';
import '../widgets/empty_state.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notesProvider = Provider.of<NotesProvider>(context);
    final notes = notesProvider.notes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notes'),
        centerTitle: true,
      ),
      body: notes.isEmpty
          ? const EmptyState()
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return NoteCard(note: note);
              },
            ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, NoteEditScreen.routeName);
        },
      ),
    );
  }
}

