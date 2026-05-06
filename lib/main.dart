import 'package:flutter/material.dart';
import 'package:helpdesk/presentation/homepage_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Helpdesk',
      debugShowCheckedModeBanner: false,
      home: const HomepageView(),
    );
  }
}
