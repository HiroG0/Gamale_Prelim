import 'task_model.dart';

class TaskService {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
  }

  void toggleTaskCompletion(String id) {
    var task = _tasks.firstWhere((task) => task.id == id);
    task.toggleComplete();
  }
}
