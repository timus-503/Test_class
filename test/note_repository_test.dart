import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test_example/api_data.dart';
import 'package:test_example/note.dart';
import 'package:test_example/note_provider.dart';
import 'package:test_example/note_repository.dart';

import 'note_repository_test.mocks.dart';

@GenerateMocks([NoteProvider])
void main() {
  late NoteProvider noteProvider;
  late NoteRepository noteRepository;

  setUpAll(() {
    noteProvider = MockNoteProvider();
    noteRepository = NoteRepository(apiProvider: noteProvider);
  });

  test("Initial Case", () {
    expect(noteRepository.items, isEmpty);
  });

  test("Success Case", () async {
    when(noteProvider.fetchNotes()).thenAnswer((_) async => ApiData.items);
    final result = await noteRepository.fetchNotes();
    final notes =
        ApiData.items.map((e) => Note(id: e["id"], name: e["name"])).toList();
    expect(result, notes);
    expect(noteRepository.items, notes);
  });

  test("Error Case", () async {
    when(noteProvider.fetchNotes())
        .thenThrow(SocketException("internet connection"));
    try {
      final result = await noteRepository.fetchNotes();
    } catch (e) {
      expect(e, isA<SocketException>());
    }
  });
}
