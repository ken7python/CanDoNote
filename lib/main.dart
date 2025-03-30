import 'package:flutter/material.dart';
import 'done_list_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CanDoNote",
      initialRoute: "/",
      routes: {
        "/": (context) => DoneListPage(),
      },
    );
  }
}