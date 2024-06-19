class TaskEventEntity {
  DateTime? dueDate;
  DateTime? from;
  bool allDay;

  TaskEventEntity({
    this.dueDate,
    this.from,
    this.allDay = false,
  });
}
