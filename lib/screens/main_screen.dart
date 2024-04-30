import 'package:flutter/material.dart';
import 'package:achadosapi/widgets/drawer_item.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerItem(
              title: 'Profile',
              icon: Icons.person,
              onTap: () {
                // Implementar navegação para a tela de perfil
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/add_item');
            },
                child: Text('Add Item'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/search_item');
            },
              child: Text('Search Item'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/feed');
            },
              child: Text('feed'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/profile');
            },
              child: Text('Profile'),
            ),
            SizedBox(height: 16.0),

          ],
        )
      ),
    );
  }
}
