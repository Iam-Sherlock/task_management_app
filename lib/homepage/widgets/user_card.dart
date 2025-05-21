import 'package:flutter/material.dart';
import 'package:task_management_app/constants/colors.dart';
import 'package:task_management_app/models/user_model.dart';

class UserListCard extends StatelessWidget {
  final UserModel user;
  List<Map<String, dynamic>> tasks;
  UserListCard({super.key, required this.user, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Colors.blue, // Primary blue border
          width: 1.5,
        ),
      ),
      shadowColor: Colors.blue.withOpacity(0.1),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name ?? 'Unnamed User',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(user.email ?? 'No email'),
            const Divider(),
            tasks.isEmpty
                ? Text("No tasks assigned.")
                : ListView.builder(
                    itemCount: tasks.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, taskIndex) {
                      final task = tasks[taskIndex];
                      return ListTile(
                        title: Text(
                            "${taskIndex + 1}. ${task['task']}" ?? 'No Title'),
                      );
                    },
                  )
          ],
        ),
      ),
    );
  }
}
