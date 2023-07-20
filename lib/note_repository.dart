import 'package:test_example/note.dart';
import 'package:test_example/note_provider.dart';

class NoteRepository {
  final NoteProvider apiProvider;

  NoteRepository({required this.apiProvider});

  List<Note> items = [];

  Future<List<Note>> fetchNotes() async {
    final result = await apiProvider.fetchNotes();
    final item = result.map((e) => Note(id: e["id"], name: e["name"])).toList();
    items.addAll(item);
    return item;
  }
}
