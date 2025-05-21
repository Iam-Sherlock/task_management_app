import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_management_app/auth/providers/auth_service.dart';

Future<List<String>> getUsersList() async {
  QuerySnapshot querySnapshot = await firestore.collection('users').get();

  List<String> emailList = querySnapshot.docs.map((doc) {
    final data = doc.data() as Map<String, dynamic>?;
    print("Data is here ==== ${data.toString()}"); // Safely cast to Map
    return data?['name'] as String? ??
        ''; // Safely access 'email' and handle null
  }).toList();

  return emailList;
}
