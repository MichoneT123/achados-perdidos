import 'package:flutter/material.dart';
import 'package:achadosapi/widgets/custom_button.dart';
import 'package:achadosapi/widgets/custom_text_field.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              labelText: 'Name',
              controller: nameController,
            ),
            SizedBox(height: 16.0),
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
              text: 'Register',
              onPressed: () {
                // Implementar lógica de registro
              },
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/main');
                },
                child: Text('Registro'),
            ),
          ],
        ),
      ),
    );
  }
}
