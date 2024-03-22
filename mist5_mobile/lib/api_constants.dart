import 'package:http/http.dart' as http;
import 'dart:convert'; // Import dart:convert to use jsonDecode

class ApiConstants {
  static const String apiUrl =
      'http://dekdee2.informatics.buu.ac.th:8070/api/books';

  // Define a method to count occurrences of book IDs from the API
  //หนังสือทั้งหมด
  static Future<int> countAll() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final List<dynamic> books = jsonDecode(response.body);

      // Count occurrences of book IDs
      int count = 0;
      for (var book in books) {
        if (book['book_id'] != null) {
          count++;
        }
      }

      return count;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Define a method to count occurrences where book_verify is equal to 0
  //หนังสือว่าง
  static Future<int> countBookVerifyEmpty() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final List<dynamic> books = jsonDecode(response.body);

      // Count occurrences where book_verify is equal to 0
      int count = 0;
      for (var book in books) {
        if (book['book_verify'] == 0) {
          count++;
        }
      }

      return count;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Define a method to count occurrences where book_verify is equal to 1
  //หนังสือรอตรวจสอบ
  static Future<int> countBookVerifyWait() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final List<dynamic> books = jsonDecode(response.body);

      // Count occurrences where book_verify is equal to 1
      int count = 0;
      for (var book in books) {
        if (book['book_verify'] == 1) {
          count++;
        }
      }

      return count;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Define a method to count occurrences where book_verify is equal to 2
  //หนังสือตรวจสอบเเล้วไม่ผ่าน
  static Future<int> countBookVerifyReject() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final List<dynamic> books = jsonDecode(response.body);

      // Count occurrences where book_verify is equal to 2
      int count = 0;
      for (var book in books) {
        if (book['book_verify'] == 2) {
          count++;
        }
      }

      return count;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Define a method to count occurrences where book_verify is equal to 3
  //หนังสือตรวจสอบผ่าน
  static Future<int> countBookVerifyPass() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final List<dynamic> books = jsonDecode(response.body);

      // Count occurrences where book_verify is equal to 3
      int count = 0;
      for (var book in books) {
        if (book['book_verify'] == 3) {
          count++;
        }
      }

      return count;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Define a method to count occurrences where book_verify is equal to 2 or 3
  //หนังสือตรวจสอบเเล้วทั้งหมด
  static Future<int> countBookVerifyall() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final List<dynamic> books = jsonDecode(response.body);

      // Count occurrences where book_verify is equal to 2 or 3
      int count = 0;
      for (var book in books) {
        if (book['book_verify'] == 2 || book['book_verify'] == 3) {
          count++;
        }
      }

      return count;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Define a method to count occurrences where book_run_number_type is equal to 1 and book_verify is equal to 2 or 3
  //หนังสือภายในตรวจเเล้วทั้งหมด
  static Future<int> countBookVerifyAllTypeIn() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final List<dynamic> books = jsonDecode(response.body);

      // Count occurrences where book_run_number_type is equal to 1 and book_verify is equal to 2 or 3
      int count = 0;
      for (var book in books) {
        if (book['book_run_number_type'] == 1 &&
            (book['book_verify'] == 2 || book['book_verify'] == 3)) {
          count++;
        }
      }

      return count;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Define a method to count occurrences where book_run_number_type is equal to 2 and book_verify is equal to 2 or 3
  //หนังสือรับเข้าตรวจเเล้วทั้งหมด
  static Future<int> countBookVerifyAllTypeInbound() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final List<dynamic> books = jsonDecode(response.body);

      // Count occurrences where book_run_number_type is equal to 2 and book_verify is equal to 2 or 3
      int count = 0;
      for (var book in books) {
        if (book['book_run_number_type'] == 2 &&
            (book['book_verify'] == 2 || book['book_verify'] == 3)) {
          count++;
        }
      }

      return count;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Define a method to count occurrences where book_run_number_type is equal to 3 and book_verify is equal to 2 or 3
  //หนังสือส่งออกตรวจเเล้วทั้งหมด
  static Future<int> countBookVerifyAllTypeOutbound() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final List<dynamic> books = jsonDecode(response.body);

      // Count occurrences where book_run_number_type is equal to 3 and book_verify is equal to 2 or 3
      int count = 0;
      for (var book in books) {
        if (book['book_run_number_type'] == 3 &&
            (book['book_verify'] == 2 || book['book_verify'] == 3)) {
          count++;
        }
      }

      return count;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Define a method to count occurrences where book_run_number_type is equal to 1 and book_verify is equal to 0
  static Future<int> countBookNullTypeIn() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final List<dynamic> books = jsonDecode(response.body);

      // Count occurrences where book_run_number_type is equal to 1 and book_verify is equal to 0
      int count = 0;
      for (var book in books) {
        if (book['book_run_number_type'] == 1 && book['book_verify'] == 0) {
          count++;
        }
      }

      return count;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Define a method to count occurrences where book_run_number_type is equal to 2 and book_verify is equal to 0
  static Future<int> countBookNullTypeInBound() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final List<dynamic> books = jsonDecode(response.body);

      int count = 0;
      for (var book in books) {
        if (book['book_run_number_type'] == 2 && book['book_verify'] == 0) {
          count++;
        }
      }

      return count;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Define a method to count occurrences where book_run_number_type is equal to 3 and book_verify is equal to 0
  static Future<int> countBookNullTypeOutBound() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final List<dynamic> books = jsonDecode(response.body);

      // Count occurrences where book_run_number_type is equal to 1 and book_verify is equal to 0
      int count = 0;
      for (var book in books) {
        if (book['book_run_number_type'] == 3 && book['book_verify'] == 0) {
          count++;
        }
      }

      return count;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Define a method to count occurrences where book_run_number_type is equal to 1 and book_verify is equal to 1
  static Future<int> countBookWaitTypeIn() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final List<dynamic> books = jsonDecode(response.body);

      int count = 0;
      for (var book in books) {
        if (book['book_run_number_type'] == 1 && book['book_verify'] == 1) {
          count++;
        }
      }

      return count;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Define a method to count occurrences where book_run_number_type is equal to 2 and book_verify is equal to 1
  static Future<int> countBookWaitTypeInBound() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final List<dynamic> books = jsonDecode(response.body);

      int count = 0;
      for (var book in books) {
        if (book['book_run_number_type'] == 2 && book['book_verify'] == 1) {
          count++;
        }
      }

      return count;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Define a method to count occurrences where book_run_number_type is equal to 3 and book_verify is equal to 1
  static Future<int> countBookWaitTypeOutBound() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final List<dynamic> books = jsonDecode(response.body);

      int count = 0;
      for (var book in books) {
        if (book['book_run_number_type'] == 3 && book['book_verify'] == 1) {
          count++;
        }
      }

      return count;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Define a method to count occurrences where book_run_number_type is equal to 1 and book_verify is equal to 2
  static Future<int> countBookRejectTypeIn() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final List<dynamic> books = jsonDecode(response.body);

      int count = 0;
      for (var book in books) {
        if (book['book_run_number_type'] == 1 && book['book_verify'] == 2) {
          count++;
        }
      }

      return count;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Define a method to count occurrences where book_run_number_type is equal to 2 and book_verify is equal to 2
  static Future<int> countBookRejectTypeInBound() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final List<dynamic> books = jsonDecode(response.body);

      int count = 0;
      for (var book in books) {
        if (book['book_run_number_type'] == 2 && book['book_verify'] == 2) {
          count++;
        }
      }

      return count;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Define a method to count occurrences where book_run_number_type is equal to 3 and book_verify is equal to 2
  static Future<int> countBookRejectTypeOutBound() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final List<dynamic> books = jsonDecode(response.body);

      int count = 0;
      for (var book in books) {
        if (book['book_run_number_type'] == 3 && book['book_verify'] == 2) {
          count++;
        }
      }

      return count;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Define a method to count occurrences where book_run_number_type is equal to 1 and book_verify is equal to 3
  static Future<int> countBookPassTypeIn() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final List<dynamic> books = jsonDecode(response.body);

      int count = 0;
      for (var book in books) {
        if (book['book_run_number_type'] == 1 && book['book_verify'] == 3) {
          count++;
        }
      }

      return count;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Define a method to count occurrences where book_run_number_type is equal to 2 and book_verify is equal to 3
  static Future<int> countBookPassTypeInBound() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final List<dynamic> books = jsonDecode(response.body);

      int count = 0;
      for (var book in books) {
        if (book['book_run_number_type'] == 2 && book['book_verify'] == 3) {
          count++;
        }
      }

      return count;
    } else {
      throw Exception('Failed to load data');
    }
  }
  // Define a method to count occurrences where book_run_number_type is equal to 3 and book_verify is equal to 3
  static Future<int> countBookPassTypeOutBOund() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final List<dynamic> books = jsonDecode(response.body);

      int count = 0;
      for (var book in books) {
        if (book['book_run_number_type'] == 3 && book['book_verify'] == 3) {
          count++;
        }
      }

      return count;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
