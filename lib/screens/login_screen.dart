import 'package:flutter/material.dart';
import 'package:achadosapi/widgets/custom_button.dart';
import 'package:achadosapi/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              labelText: 'Email',
              controller: emailController,
            ),
            SizedBox(height: 16.0),
            CustomTextField(
              labelText: 'Password',
              obscureText: true,
              controller: passwordController,
            ),
            SizedBox(height: 16.0),
            CustomButton(
              text: 'Login',
              onPressed: () {
                // Implementar lógica de autenticação
              },
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/registration');
                },
                child: Text('Registro'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/main');
                },
                child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
