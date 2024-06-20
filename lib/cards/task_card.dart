import 'package:dilify/entities/task_entity.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final TaskEntity task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(task.title),
        subtitle: (task.description == null) ? null : Text(task.description!),
      ),
    );
  }
}
