import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'models/note.dart';
import 'providers/notes_provider.dart';
import 'screens/home_screen.dart';
import 'screens/note_edit_screen.dart';
import 'services/notes_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive and register adapter
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());

  // Open Notes box
  await Hive.openBox<Note>(NotesService.notesBoxName);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NotesProvider(),
      child: MaterialApp(
        title: 'Notes App',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          useMaterial3: true,
        ),
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          NoteEditScreen.routeName: (context) => const NoteEditScreen(),
        },
      ),
    );
  }
}

