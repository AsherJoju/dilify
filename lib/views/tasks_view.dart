import 'package:dilify/cards/task_card.dart';
import 'package:dilify/constants.dart';
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

  Future<TaskEntity?> _addNewTask() async {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    DateTimeRange? dateTimeRange;

    return await showModalBottomSheet<TaskEntity?>(
      isScrollControlled: true,
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    title: const Text("New Task"),
                    actions: [
                      FloatingActionButton.extended(
                        onPressed: () {
                          Navigator.of(context).pop(
                            TaskEntity(
                              title: titleController.text,
                              description: descriptionController.text,
                              event: TaskEventEntity(
                                from: (dateTimeRange?.start == dateTimeRange?.end) ? null : dateTimeRange?.start,
                                dueDate: dateTimeRange?.end,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.check),
                        label: const Text("Save"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      label: Text("Title"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: descriptionController,
                    maxLines: null,
                    decoration: const InputDecoration(
                      label: Text("Description"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ListTile(
                    title: Text(
                      (dateTimeRange == null) ? "Select Date and Time" : toDateTimeRangeString(dateTimeRange!),
                    ),
                    leading: const Icon(Icons.calendar_today),
                    trailing: IconButton(
                      onPressed: () => setModalState(() {
                        dateTimeRange = null;
                      }),
                      icon: const Icon(Icons.clear),
                    ),
                    onTap: () async {
                      final DateTimeRange? picked = await showDateRangePicker(
                        context: context,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );

                      setModalState(() {
                        if (picked != null) {
                          dateTimeRange = picked;
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) => TaskCard(task: tasks[index]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () async {
          final TaskEntity? task = await _addNewTask();

          if (task != null) {
            setState(() {
              tasks.add(task);
            });
          }
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
