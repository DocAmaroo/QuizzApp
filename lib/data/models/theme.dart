import 'package:cloud_firestore/cloud_firestore.dart';

class ThemeModel {
  String id;
  String theme;
  String description;

  ThemeModel(
      {required this.id, required this.theme, required this.description});

  get getTheme => theme;
  get getDescription => description;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'theme': theme,
      'description': description,
    };
  }

  factory ThemeModel.fromMap(Map<String, dynamic> map) {
    return ThemeModel(
        id: map['id'], theme: map['theme'], description: map['description']);
  }

  factory ThemeModel.fromQueryDocumentSnapshot(QueryDocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    final id = snapshot.id;
    data['id'] = id;
    return ThemeModel.fromMap(data);
  }
}
