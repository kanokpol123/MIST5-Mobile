import 'package:flutter/material.dart';
import 'verify_books_dashboard.dart';
import 'dashboard_second_page.dart';

class DashboardPage extends StatelessWidget {
  final String apiUrl = 'http://dekdee2.informatics.buu.ac.th:8070/api/books';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5876E2),
        title: Text(
          'ดูสรุปหนังสือที่ตรวจแล้ว',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),

      body: VerifyDashboard(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF5876E2),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'MIS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('ดูสรุปหนังสือที่ตรวจแล้ว'),
              onTap: () {
                Navigator.pop(context); 
              },
              leading: Icon(
                Icons.library_books_outlined,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
                        ListTile(
              title: Text('ดูสรุปหนังสือทั้งหมด'),
              onTap: () {
                Navigator.pop(context); // ปิด Drawer ก่อนเปิดหน้าใหม่
                navigateToSecondPage(context);
              },
              leading: Icon(
                Icons.library_books_outlined,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void navigateToSecondPage(BuildContext context) {
  Navigator.pushReplacement( // ใช้ pushReplacement แทน push
    context,
    MaterialPageRoute(builder: (context) => DashboardSecondPage()),
  );
}
