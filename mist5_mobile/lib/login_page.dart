import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dashboard_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _usernameError = false;
  bool _passwordError = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF576BDE),
            Color(0xFF5ECFFB),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "MIS",
              style: TextStyle(
                fontSize: 96,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            _inputField("Username", usernameController,
                icon: Icons.account_circle, error: _usernameError),
            const SizedBox(height: 20),
            _passwordField(error: _passwordError),
            const SizedBox(height: 50),
            _loginBtn(),
          ],
        ),
      ),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {bool isPassword = false, IconData? icon, bool error = false}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Colors.white),
    );

    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
        prefixIcon: icon != null ? Icon(icon, color: Colors.white) : null,
        errorText: error ? 'Please enter $hintText' : null,
      ),
      obscureText: isPassword && !_isPasswordVisible,
      onChanged: (_) {
        if (error) {
          setState(() {
            error = false;
          });
        }
      },
    );
  }

  Widget _passwordField({bool error = false}) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: passwordController,
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Colors.white),
        ),
        prefixIcon: const Icon(Icons.lock, color: Colors.white),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
        errorText: error ? 'Please enter Password' : null,
      ),
      obscureText: !_isPasswordVisible,
      onChanged: (_) {
        if (error) {
          setState(() {
            error = false;
          });
        }
      },
    );
  }

  Widget _loginBtn() {
    return ElevatedButton(
      onPressed: _validateInputs,
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          "LOGIN",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.blue,
        backgroundColor: Colors.white,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  void _validateInputs() {
    String username = usernameController.text;
    String password = passwordController.text;

    setState(() {
      _usernameError = username.isEmpty;
      _passwordError = password.isEmpty;
    });

    if (!_usernameError && !_passwordError) {
      // Send request to API for authentication
      authenticateUser(username, password);
    } else {
      // Handle case where username or password is empty
      print('Please enter both username and password');
    }
  }

  void authenticateUser(String username, String password) async {
    final apiUrl =
        'http://dekdee2.informatics.buu.ac.th:8070/api/hash_password';
    final response = await http.post(Uri.parse(apiUrl), body: {
      'username': username,
      'password': password,
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      bool isAuthenticated = data['status'];

      if (isAuthenticated) {
        // Authentication successful
        navigateToNextPage(context);
      } else {
        // Handle invalid credentials here
        print('Invalid username or password');
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Login Failed'),
            content: Text('Username or password is incorrect.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } else {
      // Handle API request error here
      print('Failed to authenticate user');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Failed to authenticate user.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void navigateToNextPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DashboardPage()),
    );
  }
}
