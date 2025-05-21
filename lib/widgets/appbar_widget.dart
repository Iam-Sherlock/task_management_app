import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/constants/colors.dart';
import 'package:task_management_app/constants/utils.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isInformation;
  final bool backArraw;

  AppbarWidget(
      {super.key,
      required this.title,
      required this.isInformation,
      this.backArraw = false});

  @override
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryBgColor,
        title: Stack(
          alignment: Alignment.center,
          children: [
            if (backArraw)
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(Icons.arrow_back_ios, size: 20, color: AppColors.primaryBlue),
                ),
              ),
            Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (isInformation)
              Align(
                alignment: Alignment.centerRight,
                child: PopupMenuButton<String>(
                  icon: Icon(Icons.more_vert, color: AppColors.primaryBlue),
                  onSelected: (String value) async {
                    if (value == 'Profile') {
                      Navigator.pushNamed(context, '/profile');
                    } else if (value == 'Settings') {
                      Navigator.pushNamed(context, '/settings');
                    } else if (value == 'Logout') {
                      // Handle logout
                    }
                  },
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem<String>(
                      value: 'Profile',
                      child: Text('Profile'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Settings',
                      child: Text('Settings'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Logout',
                      child: Text('Logout'),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
