import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/note.dart';
import '../providers/notes_provider.dart';

class NoteEditScreen extends StatefulWidget {
  static const String routeName = '/edit';

  final String? noteId; // Pass this when editing

  const NoteEditScreen({super.key, this.noteId});

  @override
  State<NoteEditScreen> createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  bool _isEditing = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.noteId != null && !_isEditing) {
      final notesProvider = Provider.of<NotesProvider>(context, listen: false);
      final note = notesProvider.getNoteById(widget.noteId!);
      if (note != null) {
        _titleController.text = note.title;
        _contentController.text = note.content;
        _isEditing = true;
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notesProvider = Provider.of<NotesProvider>(context, listen: false);
    final isEdit = widget.noteId != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Note' : 'Add Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                maxLength: 64,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.trim().isEmpty ? 'Title is required' : null,
              ),
              const SizedBox(height: 18),
              Expanded(
                child: TextFormField(
                  controller: _contentController,
                  expands: true,
                  maxLines: null,
                  decoration: const InputDecoration(
                    labelText: 'Content',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => value == null || value.trim().isEmpty ? 'Content is required' : null,
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      if (isEdit) {
                        await notesProvider.updateNote(
                          widget.noteId!,
                          _titleController.text,
                          _contentController.text,
                        );
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Note updated!')));
                          Navigator.of(context).pop();
                        }
                      } else {
                        await notesProvider.addNote(
                          _titleController.text,
                          _contentController.text,
                        );
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Note added!')));
                          Navigator.of(context).pop();
                        }
                      }
                    }
                  },
                  child: Text(isEdit ? 'Save Changes' : 'Add Note'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

