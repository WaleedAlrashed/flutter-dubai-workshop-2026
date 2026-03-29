import 'package:flutter/material.dart';
import 'screens/chat_screen.dart';

const geminiApiKey = 'AIzaSyCYi9g0YmOPxzhjkTHdfXS6ZvOAnEpLpqU';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gemini Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFC0392B),
        ),
        useMaterial3: true,
      ),
      home: const ChatScreen(),
    );
  }
}
