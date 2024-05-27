import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:perdidos_e_achados/firebase_options.dart';
import 'package:perdidos_e_achados/screens/ItemListScreen.dart';
import 'package:perdidos_e_achados/screens/add_item_screen.dart';
import 'package:perdidos_e_achados/screens/feed_screen.dart';
import 'package:perdidos_e_achados/screens/login_screen.dart';
import 'package:perdidos_e_achados/screens/main_screen.dart';
import 'package:perdidos_e_achados/screens/profile_screen.dart';
import 'package:perdidos_e_achados/screens/registration_screen.dart';
import 'package:perdidos_e_achados/screens/search_item_screen.dart';
import 'package:perdidos_e_achados/servicies/tokenService.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<String?> _routByTokenContaines() async {
    var token = await SharedPreferences.getInstance();
    String? tokenString = await AuthService().getToken();

    if (tokenString != null) {
      print(token);
      return "/main";
    }
    return "/login";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lost and Found App',
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSwatch(accentColor: Colors.blue)),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/registration': (context) => const RegisterScreen(),
        '/main': (context) => const MainScreen(),
        '/add_item': (context) => const AddItemScreen(),
        '/search_item': (context) => SearchItemScreen(),
        '/feed': (context) => FeedScreen(),
        '/profile': (context) => ProfileScreen(),
        '/my-items': (context) => ItemListScreen()
      },
    );
  }
}
