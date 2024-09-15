import 'dart:io';

import 'package:prelimexam/providers.dart';
import 'package:prelimexam/task_model.dart';
import 'package:riverpod/riverpod.dart';

void main(List<String> arguments) {
  final container = ProviderContainer();
  final taskService = container.read(taskServiceProvider);

  while (true) {
    print('Enter a command (add/view/exit)');
    String? command = stdin.readLineSync();

    // Debugging: Check if command is read correctly
    print('Command entered: $command');

    if (command == 'add') {
      print('Enter task title:');
      String? title = stdin.readLineSync();

      // Debugging: Check if task title is read correctly
      print('Task title entered: $title');

      if (title != null && title.isNotEmpty) {
        taskService.addTask(Task(id: DateTime.now().toString(), title: title));
        print('Task added!');
      } else {
        print('Task title cannot be empty.');
      }
    } else if (command == 'view') {
      print('Listing all tasks:');
      // Use a traditional for loop instead of forEach
      for (var task in taskService.tasks) {
        print(
            '${task.title} - ${task.isCompleted ? 'Completed' : 'Incomplete'}');
      }
    } else if (command == 'exit') {
      print('Exiting...');
      break;
    } else {
      print('Invalid command. Please enter add, view, or exit.');
    }
  }
}
