import 'package:flutter/material.dart';

// import here
import 'package:project_two/screens/login_screen.dart';
import 'package:project_two/screens/detail_screen.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      theme: ThemeData(primarySwatch: Colors.purple),
      initialRoute: '/Home',
      routes: {
        '/Login': (context) => LoginScreen(),
        '/Home': (context) => const HomePage(),
        '/Detail': (context) => const NoteDetail()
      },
    );
  }
}
