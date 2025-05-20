import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstant {
  static String get url => dotenv.env['KEY-URL'] ?? '';
  static String get anonKey => dotenv.env['KEY-API'] ?? '';
}
