import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';

import 'features/widgets/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: mVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: mVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const AuthScreen(),
    );
  }
}
