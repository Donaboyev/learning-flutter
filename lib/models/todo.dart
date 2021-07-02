import 'package:for_learning/utils/constants.dart';

class Todo {
  final int id;
  final int taskId;
  final String title;
  final int isDone;
  Todo({this.id, this.taskId, this.title, this.isDone});

  Map<String, dynamic> toMap() {
    return {
      Constants.ID: id,
      Constants.TASK_ID: taskId,
      Constants.TITLE: title,
      Constants.IS_DONE: isDone,
    };
  }
}
