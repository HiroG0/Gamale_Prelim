import 'package:riverpod/riverpod.dart';
import 'task_service.dart';

final taskServiceProvider = Provider((ref) => TaskService());
