import 'package:flutter/material.dart';
import 'package:achadosapi/widgets/custom_button.dart';
import 'package:achadosapi/widgets/custom_text_field.dart';

class AddItemScreen extends StatelessWidget {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              labelText: 'Description',
              controller: descriptionController,
            ),
            SizedBox(height: 16.0),
            CustomTextField(
              labelText: 'Location',
              controller: locationController,
            ),
            SizedBox(height: 16.0),
            CustomButton(
              text: 'Submit',
              onPressed: () {
                // Implementar lógica para adicionar o item
              },
            ),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacementNamed(context, '/main');
            },
              child: Text('Add Item'),
            ),
          ],
        ),
      ),
    );
  }
}
