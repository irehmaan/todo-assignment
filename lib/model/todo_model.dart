import 'dart:convert';

import 'package:hive/hive.dart';

part 'todo_model.g.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
@HiveType(typeId: 0)
class ToDoModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
   bool? completed;
  ToDoModel({
    required this.id,
    required this.title,
    required this.completed,
  });

  ToDoModel copyWith({
    int? id,
    String? title,
    bool? completed,
  }) {
    return ToDoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  factory ToDoModel.fromMap(Map<String, dynamic> map) {
    return ToDoModel(
      id: map['id'] as int,
      title: map['title'] as String,
      completed: map['completed'] != null ? map['completed'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ToDoModel.fromJson(String source) =>
      ToDoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ToDoModel(id: $id, title: $title, completed: $completed)';

  @override
  bool operator ==(covariant ToDoModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.completed == completed;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ completed.hashCode;
}
