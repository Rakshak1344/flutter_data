import '../export.dart';
import 'Adapters/TaskAdapter.dart';
part 'Task.g.dart';

@JsonSerializable()
@DataRepository([TaskAdapter])
class Task with DataModel<Task> {
  @override
  final int? id;
  final String title;
  final bool completed;

  Task({this.id, required this.title, this.completed = false});

  Task toggleCompleted(Task task) {
    return Task(id: task.id, title: task.title, completed: !task.completed)
        .was(task);
  }
}
