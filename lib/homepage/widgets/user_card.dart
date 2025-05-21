import 'package:flutter/material.dart';
import 'package:task_management_app/constants/colors.dart';

class UserListCard extends StatelessWidget {
  String nameOfEmployees;
  UserListCard({super.key,required this.nameOfEmployees});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        overflow: TextOverflow.visible,
                        nameOfEmployees,
                        style: const TextStyle(
                            color: AppColors.primaryBlue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  nameOfEmployees,
                  style: const TextStyle(
                    color: AppColors.primaryBlue,
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
            alignment: Alignment.topRight,
            child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: null)),
      ],
    );
  }
}
