import 'package:flutter/material.dart';
import 'package:modelhandling/screen/dashboard_screen.dart';
import 'package:modelhandling/screen/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screen/dashboard_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://tuntdfdiwnemdzclpsto.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR1bnRkZmRpd25lbWR6Y2xwc3RvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE4ODM0OTcsImV4cCI6MjA4NzQ1OTQ5N30.0eqWcyF8xQ__soWqn9DgD_aFoDT3xsWSbf9ck4Ohsuo',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Grade Calculator',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: LoginPage(),
    );
  }
}
