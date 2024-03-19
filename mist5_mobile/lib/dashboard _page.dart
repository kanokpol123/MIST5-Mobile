import 'package:flutter/material.dart';
import 'book_list_widget.dart';

class SecondPage extends StatelessWidget {
  final String apiUrl = 'http://dekdee2.informatics.buu.ac.th:8070/api/books';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ดูสรุปหนังสือที่ตรวจแล้ว'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Navigate back to the LoginPage
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: BookListWidget(apiUrl: apiUrl), // Display book list here
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Add your navigation logic here
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Add your navigation logic here
              },
            ),
          ],
        ),
      ),
    );
  }
}
