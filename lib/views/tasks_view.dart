import 'package:dilify/entities/task_entity.dart';
import 'package:dilify/entities/task_event_entity.dart';
import 'package:flutter/material.dart';

class TasksView extends StatefulWidget {
  const TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  List<TaskEntity> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(tasks[index].title),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          setState(() {
            tasks.add(TaskEntity(title: tasks.length.toString(), event: TaskEventEntity()));
          });
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.home),
            ),
            IconButton(
              disabledColor: Theme.of(context).colorScheme.primary,
              onPressed: null,
              icon: const Icon(Icons.assignment),
            ),
            Container(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.local_cafe),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
    );
  }
}
