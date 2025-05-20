import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_6_7/my_app.dart';
import 'package:supabase_6_7/utils/constant/api_constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: ApiConstant.url, anonKey: ApiConstant.anonKey);
  runApp(MyApp());
}
