import 'package:task_management_app/models/user_model.dart';

class UserWithTasks {
  final UserModel user;
  final List<Map<String, dynamic>> tasks;

  UserWithTasks({required this.user, required this.tasks});
}
