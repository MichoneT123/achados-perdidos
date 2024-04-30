import 'package:flutter/material.dart';
import 'package:achadosapi/screens/main_screen.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feed'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/main');
          },
          child: Text('Feed'),
        ),
      ),
    );
  }
}
