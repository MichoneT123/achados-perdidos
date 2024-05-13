import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:perdidos_e_achados/servicies/userService.dart';
import 'package:perdidos_e_achados/widgets_reutilizaveis/MyInputField.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  File? _image;

  Future<void> _getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _fetchUserInfo();
      });
    }
  }

  void _fetchUserInfo() async {
    final userInfo = await UserService().userDetails();
    if (userInfo != null) {
      setState(() {
        firstNameController.text = userInfo.primeiroNome ?? '';
        lastNameController.text = userInfo.segundoNome ?? '';
        emailController.text = userInfo.email ?? '';
        phoneController.text = userInfo.telefone ?? '';
      });
    } else {
      print("Nulo");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Usuario",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: GestureDetector(
                          onTap: _getImage,
                          child: Container(
                            width: 150.0, // Increased size
                            height: 150.0, // Increased size
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey, // Visible border
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(
                                  75.0), // Increased border radius
                              image: _image != null
                                  ? DecorationImage(
                                      image: FileImage(_image!),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                            child: _image == null
                                ? Icon(
                                    Icons.person,
                                    size: 100.0,
                                    color: Colors.grey[300],
                                  )
                                : null,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      MyInputField(
                        label: "First Name",
                        placeholder: "Enter your first name",
                        textEditingController: firstNameController,
                        isPasswordField: false,
                      ),
                      const SizedBox(height: 20),
                      MyInputField(
                        label: "Last Name",
                        placeholder: "Enter your last name",
                        textEditingController: lastNameController,
                        isPasswordField: false,
                      ),
                      const SizedBox(height: 20),
                      MyInputField(
                        label: "Email",
                        placeholder: "Enter your email address",
                        textEditingController: emailController,
                        isPasswordField: false,
                        isEmailField: true,
                      ),
                      const SizedBox(height: 20),
                      MyInputField(
                        label: "Phone",
                        placeholder: "Enter your phone number",
                        textEditingController: phoneController,
                        isPasswordField: false,
                        isPhoneField: true,
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/main');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(14),
                                  bottomLeft: Radius.circular(14),
                                  bottomRight: Radius.circular(14))),
                          child: const Center(
                              child: Text(
                            "Atualizar",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
