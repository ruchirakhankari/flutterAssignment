import 'package:provider/provider.dart';
import 'package:flutterassignment/view-model/provider/todo_provider.dart';
import 'package:flutterassignment/view/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TopProvider(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
