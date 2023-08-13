import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_pro/weather_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = ThemeData.light(useMaterial3: true);

  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    _currentTheme = _currentTheme == ThemeData.light(useMaterial3: true)
        ? ThemeData.dark(useMaterial3: true)
        : ThemeData.light(useMaterial3: true);
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      home: const WeatherScreen(),
    );
  }
}
