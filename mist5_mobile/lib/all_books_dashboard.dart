// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fl_chart/fl_chart.dart';
import 'api_constants.dart';

class AllDashboard extends StatefulWidget {
  @override
  _AllDashboardState createState() => _AllDashboardState();
}

class _AllDashboardState extends State<AllDashboard> {
  late Future<List<int>> bookCounts;

  @override
  void initState() {
    super.initState();
    // Call the API function to get book counts
    bookCounts = getBookCounts();
  }

  Future<List<int>> getBookCounts() async {
    try {
      // Assuming ApiConstants class has the necessary functions to fetch book counts
      int countAll = await ApiConstants.countAll();
      int countBookVerifyAllTypeIn =
          await ApiConstants.countBookVerifyAllTypeIn();
      int countBookVerifyAllTypeInbound =
          await ApiConstants.countBookVerifyAllTypeInbound();
      int countBookVerifyAllTypeOutbound =
          await ApiConstants.countBookVerifyAllTypeOutbound();

      // int verifyEmptyCount = await ApiConstants.countBookVerifyEmpty();
      // int verifyWaitCount = await ApiConstants.countBookVerifyWait();
      // int verifyRejectCount = await ApiConstants.countBookVerifyReject();
      // int verifyPassCount = await ApiConstants.countBookVerifyPass();

      return [
        countAll,
        countBookVerifyAllTypeOutbound,
        countBookVerifyAllTypeInbound,
        countBookVerifyAllTypeIn,
      ];
    } catch (e) {
      // Handle error if API call fails
      print('Error fetching book counts: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<int>>(
        future: bookCounts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            // Assuming the data is in the format [allCount, verifyEmptyCount, verifyWaitCount, verifyRejectCount, verifyPassCount]
            List<int> counts = snapshot.data!;
            return Column(
              children: [
                SizedBox(height: 20),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Row(children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(
                              8), // กำหนด Padding ทั้งสี่ด้านเป็น 8 พิกเซล
                          child: FutureBuilder<int>(
                            future: ApiConstants.countAll(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else if (snapshot.hasData) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border(
                                      right: BorderSide(
                                        color: Color(
                                            0xFF5876E2), // Color of the right border
                                        width: 8, // Width of the right border
                                      ),
                                      top: BorderSide(
                                        color: Color(
                                            0xFF5876E2), // Color of the top border
                                        width: 2, // Width of the top border
                                      ),
                                      bottom: BorderSide(
                                        color: Color(
                                            0xFF5876E2), // Color of the bottom border
                                        width: 2, // Width of the bottom border
                                      ),
                                      left: BorderSide(
                                        color: Color(
                                            0xFF5876E2), // Color of the left border
                                        width: 2, // Width of the left border
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconTheme(
                                            data: IconThemeData(size: 26),
                                            child: Icon(
                                              Icons.library_books,
                                              color: Color(0xFF5876E2),
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            'หนังสือตรวจแล้วทั้งหมด',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        snapshot.data.toString(),
                                        style: TextStyle(
                                          fontSize: 36,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return Text('No data available');
                              }
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(
                              8), // กำหนด Padding ทั้งสี่ด้านเป็น 8 พิกเซล
                          child: FutureBuilder<int>(
                            future: ApiConstants.countBookVerifyEmpty(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else if (snapshot.hasData) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border(
                                      right: BorderSide(
                                        color: Color(
                                            0xFF5876E2), // Color of the right border
                                        width: 8, // Width of the right border
                                      ),
                                      top: BorderSide(
                                        color: Color(
                                            0xFF5876E2), // Color of the top border
                                        width: 2, // Width of the top border
                                      ),
                                      bottom: BorderSide(
                                        color: Color(
                                            0xFF5876E2), // Color of the bottom border
                                        width: 2, // Width of the bottom border
                                      ),
                                      left: BorderSide(
                                        color: Color(
                                            0xFF5876E2), // Color of the left border
                                        width: 2, // Width of the left border
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconTheme(
                                            data: IconThemeData(size: 26),
                                            child: Icon(
                                              Icons.library_books,
                                              color: Color(0xFF5876E2),
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            'หนังสือที่ยังไม่เสร็จ',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        snapshot.data.toString(),
                                        style: TextStyle(
                                          fontSize: 36,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return Text('No data available');
                              }
                            },
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Row(children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(
                              8), // กำหนด Padding ทั้งสี่ด้านเป็น 8 พิกเซล
                          child: FutureBuilder<int>(
                            future: ApiConstants.countBookVerifyWait(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else if (snapshot.hasData) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border(
                                      right: BorderSide(
                                        color: Color(
                                            0xFFFF9900), // Color of the right border
                                        width: 8, // Width of the right border
                                      ),
                                      top: BorderSide(
                                        color: Color(
                                            0xFFFF9900), // Color of the top border
                                        width: 2, // Width of the top border
                                      ),
                                      bottom: BorderSide(
                                        color: Color(
                                            0xFFFF9900), // Color of the bottom border
                                        width: 2, // Width of the bottom border
                                      ),
                                      left: BorderSide(
                                        color: Color(
                                            0xFFFF9900), // Color of the left border
                                        width: 2, // Width of the left border
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconTheme(
                                            data: IconThemeData(size: 14),
                                            child: Icon(
                                              Icons.library_books,
                                              color: Color(0xFFFF9900),
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            'หนังสือที่รอตรวจสอบ',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        snapshot.data.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return Text('No data available');
                              }
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(
                              8), // กำหนด Padding ทั้งสี่ด้านเป็น 8 พิกเซล
                          child: FutureBuilder<int>(
                            future: ApiConstants.countBookVerifyReject(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else if (snapshot.hasData) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border(
                                      right: BorderSide(
                                        color: Color(
                                            0xFF00afb2), // Color of the right border
                                        width: 8, // Width of the right border
                                      ),
                                      top: BorderSide(
                                        color: Color(
                                            0xFF00afb2), // Color of the top border
                                        width: 2, // Width of the top border
                                      ),
                                      bottom: BorderSide(
                                        color: Color(
                                            0xFF00afb2), // Color of the bottom border
                                        width: 2, // Width of the bottom border
                                      ),
                                      left: BorderSide(
                                        color: Color(
                                            0xFF00afb2), // Color of the left border
                                        width: 2, // Width of the left border
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconTheme(
                                            data: IconThemeData(size: 14),
                                            child: Icon(
                                              Icons.library_books,
                                              color: Color(0xFF00afb2),
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            'หนังสือที่ตรวจไม่ผ่าน',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        snapshot.data.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return Text('No data available');
                              }
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(
                              8), // กำหนด Padding ทั้งสี่ด้านเป็น 8 พิกเซล
                          child: FutureBuilder<int>(
                            future: ApiConstants.countBookVerifyPass(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else if (snapshot.hasData) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border(
                                      right: BorderSide(
                                        color: Color(
                                            0xFF990099), // Color of the right border
                                        width: 8, // Width of the right border
                                      ),
                                      top: BorderSide(
                                        color: Color(
                                            0xFF990099), // Color of the top border
                                        width: 2, // Width of the top border
                                      ),
                                      bottom: BorderSide(
                                        color: Color(
                                            0xFF990099), // Color of the bottom border
                                        width: 2, // Width of the bottom border
                                      ),
                                      left: BorderSide(
                                        color: Color(
                                            0xFF990099), // Color of the left border
                                        width: 2, // Width of the left border
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconTheme(
                                            data: IconThemeData(size: 14),
                                            child: Icon(
                                              Icons.library_books,
                                              color: Color(0xFF990099),
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            'หนังสือที่ตรวจผ่าน',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        snapshot.data.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return Text('No data available');
                              }
                            },
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                SizedBox(height: 20),
                // Other UI elements here based on counts if needed
              ],
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
