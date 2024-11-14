import 'package:flutter/material.dart';
import 'package:perpustakaan/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://noxsramtcjfszazmibcz.supabase.co', 
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5veHNyYW10Y2pmc3phem1pYmN6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE1NTM5NTEsImV4cCI6MjA0NzEyOTk1MX0.N1SyJumgRA4yyY6Qn6PMXUn59gltVYhhowDYS6Q9aXU');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Perpustakaan',
      home: BookListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
 

