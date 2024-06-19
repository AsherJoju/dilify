import 'package:dilify/constants.dart';
import 'package:dilify/entities/task_event_entity.dart';
import 'package:dilify/states/task_state.dart';

class TaskEntity {
  late final String id;
  late final DateTime createdDate;
  late DateTime modifiedDate;
  late TaskState state;
  String title;
  String? description;
  TaskEventEntity event;

  TaskEntity({
    required this.title,
    this.description,
    required this.event,
  }) {
    DateTime now = DateTime.now();

    id = getRandomUuid();
    createdDate = now;
    modifiedDate = now;

    if (now.isBefore(event.from ?? now)) {
      state = TaskState.unstarted;
    } else if (now.isAfter(event.dueDate ?? now)) {
      state = TaskState.overdue;
    } else {
      state = TaskState.pending;
    }
  }
}
