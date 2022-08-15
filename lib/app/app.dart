import 'package:flutter/material.dart';
import 'package:flutter_http_post/home/presentation/widgets/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      home: const Homepage(),
    );
  }
}
