import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookListWidget extends StatefulWidget {
  final String apiUrl;

  const BookListWidget({Key? key, required this.apiUrl}) : super(key: key);

  @override
  _BookListWidgetState createState() => _BookListWidgetState();
}

class _BookListWidgetState extends State<BookListWidget> {
  List<dynamic> books = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(widget.apiUrl));
    if (response.statusCode == 200) {
      setState(() {
        books = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Map<String, int> getRunNumberTypeCounts() {
    Map<String, int> counts = {'1': 0, '2': 0, '3': 0};

    for (var book in books) {
      String runNumberType = book['book_run_number_type'].toString();
      if (counts.containsKey(runNumberType)) {
        counts[runNumberType] = counts[runNumberType]! + 1;
      }
    }

    return counts;
  }

  @override
  Widget build(BuildContext context) {
    final counts = getRunNumberTypeCounts();

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return ListTile(
                title: Text('Book Name: ${book['book_name']}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Book ID: ${book['book_id']}'),
                    Text('Run Number: ${book['book_run_number']}'),
                    Text('Run Number Type: ${book['book_run_number_type']}'),
                    Text('Number Date: ${book['book_number_date']}'),
                    Text('Sent To: ${book['book_sent_to'] ?? 'N/A'}'),
                    Text('Book Verify: ${book['book_verify']}'),
                    Text('Book Type: ${book['book_run_number_type']}'),
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          height: 200,
          child: PieChartWidget(counts),
        ),
      ],
    );
  }
}

class PieChartWidget extends StatelessWidget {
  final Map<String, int> counts;

  PieChartWidget(this.counts);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(200, 200),
      painter: PieChartPainter(counts),
    );
  }
}

class PieChartPainter extends CustomPainter {
  final Map<String, int> counts;

  PieChartPainter(this.counts);

  @override
  void paint(Canvas canvas, Size size) {
    double total = counts.values.fold(0, (prev, element) => prev + element);
    double startAngle = 0.0;

    counts.forEach((runNumberType, count) {
      double sweepAngle = (count / total) * 2 * 3.14;
      Paint paint = Paint()
        ..style = PaintingStyle.fill
        ..color = _getColor(runNumberType);
      canvas.drawArc(Rect.fromLTWH(0, 0, size.width, size.height), startAngle,
          sweepAngle, true, paint);
      startAngle += sweepAngle;
    });
  }

  Color _getColor(String runNumberType) {
    switch (runNumberType) {
      case '1':
        return Colors.blue;
      case '2':
        return Colors.green;
      case '3':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
