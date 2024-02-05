import 'package:flutter/material.dart';
import 'package:n_audio_player_with_provider/pages/HomePage.dart';
import 'package:n_audio_player_with_provider/pages/SearchPage.dart';

void main() {
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
       
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),

      routes: {
        '/': (context) => SearchPage(),
        '/home': (context) => HomePage(),
      },

      home: SearchPage(),
    );
  }
}
