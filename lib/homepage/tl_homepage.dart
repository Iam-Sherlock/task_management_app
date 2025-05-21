import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:task_management_app/constants/style.dart';
import 'package:task_management_app/homepage/provider/homepage_provider.dart';
import 'package:task_management_app/homepage/widgets/add_task_bottom_sheet.dart';
import 'package:task_management_app/homepage/widgets/user_card.dart';
import 'package:task_management_app/widgets/appbar_widget.dart';

class TeamLeadHomepage extends StatefulWidget {
  const TeamLeadHomepage({super.key});

  @override
  State<TeamLeadHomepage> createState() => _TeamLeadHomepageState();
}

class _TeamLeadHomepageState extends State<TeamLeadHomepage> {
  @override
  void initState() {
    super.initState();
    // Fetch the initial list when the widget is created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserListProvider>(context, listen: false).fetchUsersListNew();
      Provider.of<UserListProvider>(context, listen: false).fetchUsersList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            builder: (context) => Consumer<UserListProvider>(
              builder: (context, userListProvider, _) {
                return AddTaskBottomSheet(userList: userListProvider.users);
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppbarWidget(
        title: "Nulinz Task Manager",
        isInformation: false,
        backArraw: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "List of Employees and Their Tasks",
              style: Style.subHeadingStyle,
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: Consumer<UserListProvider>(
              builder: (context, userListProvider, _) {
                final usersWithTasks = userListProvider.userWithTasksList;

                return ListView.builder(
                  itemCount: usersWithTasks.length,
                  itemBuilder: (context, index) {
                    final user = usersWithTasks[index].user;
                    final tasks = usersWithTasks[index].tasks;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: UserListCard(
                        user: user,
                        tasks: tasks,
                      ),
                    );

                    // return Card(
                    //   elevation: 3,
                    //   margin: const EdgeInsets.symmetric(
                    //       horizontal: 12, vertical: 8),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(12.0),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //           user.name ?? 'Unnamed User',
                    //           style: TextStyle(
                    //               fontSize: 18, fontWeight: FontWeight.bold),
                    //         ),
                    //         const SizedBox(height: 4),
                    //         Text(user.email ?? 'No email'),
                    //         const Divider(),
                    //         tasks.isEmpty
                    //             ? Text("No tasks assigned.")
                    //             : ListView.builder(
                    //                 itemCount: tasks.length,
                    //                 shrinkWrap: true,
                    //                 physics:
                    //                     const NeverScrollableScrollPhysics(),
                    //                 itemBuilder: (context, taskIndex) {
                    //                   final task = tasks[taskIndex];
                    //                   return ListTile(
                    //                     title: Text(
                    //                         "${taskIndex + 1}. ${task['task']}" ??
                    //                             'No Title'),
                    //                   );
                    //                 },
                    //               )
                    //       ],
                    //     ),
                    //   ),
                    // );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
