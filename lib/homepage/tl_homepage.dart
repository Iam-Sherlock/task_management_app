import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_management_app/constants/colors.dart';
import 'package:task_management_app/constants/style.dart';
import 'package:task_management_app/homepage/provider/homepage_provider.dart';
import 'package:task_management_app/homepage/widgets/user_card.dart';
import 'package:task_management_app/widgets/appbar_widget.dart';

class TeamLeadHomepage extends StatefulWidget {
  const TeamLeadHomepage({super.key});

  @override
  State<TeamLeadHomepage> createState() => _TeamLeadHomepageState();
}

List<String> userList = [];

@override
class _TeamLeadHomepageState extends State<TeamLeadHomepage> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      userList = await getUsersList();
      print("userList==== $userList");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Nulinz Task Manager",
        isInformation: false,
        backArraw: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            // Wrap the Container with Expanded
            child: Container(
                // decoration: BoxDecoration(
                //     color: AppColors.primaryBgColor,
                //     boxShadow: AppColors.cardBoxShadow,
                //     borderRadius: BorderRadius.only(
                //         topLeft: Radius.circular(40),
                //         topRight: Radius.circular(40))),
                child: Column(
              children: [
                Text(
                  "List of Employees",
                  style: Style.subHeadingStyle,
                  textAlign: TextAlign.left,
                ),
                Expanded(
                  // Wrap SingleChildScrollView with Expanded as well
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      shrinkWrap: true, // Important for nested ListViews
                      physics:
                          ClampingScrollPhysics(), // Optional: Prevents bouncing
                      itemCount: userList.length,
                      itemBuilder: (context, index) {
                        return UserListCard(
                          nameOfEmployees: userList[index],
                        );
                      },
                    ),
                  ),
                )
              ],
            )),
          ),
        ],
      ),
    );
  }
}
