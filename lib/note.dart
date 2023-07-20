import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final int id;
  final String name;

  const Note({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
