import 'package:flutter/material.dart';
import 'package:modelhandler/screen/product_screen.dart';
import 'package:modelhandler/screen/student_screen.dart';
import 'package:modelhandler/user_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const StudentPage(),
    );
  }
}
