import 'package:test_example/api_data.dart';

class NoteProvider {
  Future<List<Map<String, dynamic>>> fetchNotes() async {
    await Future.delayed(const Duration(seconds: 2));
    return ApiData.items;
  }
}
