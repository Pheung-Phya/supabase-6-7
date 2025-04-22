import 'package:flutter/material.dart';
import 'package:supabase_6_7/my_app.dart';
import 'package:supabase_6_7/utils/constant/api_constant.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(url: ApiConstant.url, anonKey: ApiConstant.anonKey);

  runApp(MyApp());
}
