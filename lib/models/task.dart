import 'package:for_learning/utils/constants.dart';

class Task {
  final int id;
  final String title;
  final String description;
  Task({this.id, this.title, this.description});

  Map<String, dynamic> toMap() {
    return {
      Constants.ID: id,
      Constants.TITLE: title,
      Constants.DESCRIPTION: description,
    };
  }
}
