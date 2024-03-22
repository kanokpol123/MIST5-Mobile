import 'package:flutter/material.dart';
import 'login_page.dart';
import 'api_constants.dart'; // Import the ApiConstants file

void main() {
  // Call the method to fetch and print the sum of book IDs
  ApiConstants.countAll().then((count) {
    print('count of book IDs: $count');
  }).catchError((error) {
    print('Error fetching sum: $error');
  });

  // Run the application
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
