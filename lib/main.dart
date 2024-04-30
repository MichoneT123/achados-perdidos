import 'package:flutter/material.dart';
import 'package:achadosapi/screens/add_item_screen.dart';
import 'package:achadosapi/screens/feed_screen.dart';
import 'package:achadosapi/screens/login_screen.dart';
import 'package:achadosapi/screens/profile_screen.dart';
import 'package:achadosapi/screens/registration_screen.dart';
import 'package:achadosapi/screens/search_item_screen.dart';
import 'package:achadosapi/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lost and Found App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/registration': (context) => RegistrationScreen(),
        '/main': (context) => MainScreen(),
        '/add_item': (context) => AddItemScreen(),
        '/search_item': (context) => SearchItemScreen(),
        '/feed': (context) => FeedScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
