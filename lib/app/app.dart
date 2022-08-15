import 'package:flutter/material.dart';
import 'package:flutter_http_post/home/presentation/widgets/homepage.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homepage(),
    );
  }
}
