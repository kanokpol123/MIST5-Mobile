import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
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
      body: Center(
        child: Text(
          'This is the second page',
          style: TextStyle(fontSize: 24),
        ),
      ),
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
