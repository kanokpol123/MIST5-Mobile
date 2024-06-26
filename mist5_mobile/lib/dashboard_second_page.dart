import 'package:flutter/material.dart';
import 'all_books_dashboard.dart';
import 'dashboard_page.dart';
import 'login_page.dart';

class DashboardSecondPage extends StatelessWidget {
  final String apiUrl = 'http://dekdee2.informatics.buu.ac.th:8070/api/books';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5876E2),
        title: Text(
          'ดูสรุปหนังสือทั้งหมด',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
            IconButton(
              icon: Icon(Icons.logout, color: Colors.white),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          LoginPage()), // ตัวอย่างเท่านี้เท่านั้น คุณต้องเปลี่ยนเป็นหน้า Login ของคุณ
                  (Route<dynamic> route) =>
                      false, // ล้าง stack ของหน้าปัจจุบันทั้งหมด
                );
              },
            ),
        ],
        iconTheme: IconThemeData(color: Colors.white)
      ),
      body: AllDashboard(),
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
              title: Text('ดูสรุปหนังสือตรวจแล้ว'),
              onTap: () {
                Navigator.pop(context); // ปิด Drawer ก่อนเปลี่ยนหน้า
                navigateToFirstPage(context);
              },
              leading: Icon(
                Icons.check_circle_outline,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            ListTile(
              title: Text('ดูสรุปหนังสือทั้งหมด'),
              onTap: () {
                Navigator.pop(context);
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

void navigateToFirstPage(BuildContext context) {
  Navigator.pushReplacement(
    // ใช้ pushReplacement แทน push
    context,
    MaterialPageRoute(builder: (context) => DashboardPage()),
  );
}
