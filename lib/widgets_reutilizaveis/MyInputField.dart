import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class MyInputField extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextEditingController textEditingController;
  final bool isPasswordField;
  final bool? isEmailField; // Tornando isEmailField opcional
  final bool? isPhoneField; // Tornando isPhoneField opcional
  final bool? isDateField;

  const MyInputField(
      {Key? key,
      required this.placeholder,
      required this.textEditingController,
      required this.label,
      required this.isPasswordField,
      this.isEmailField,
      this.isPhoneField,
      this.isDateField})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(14),
              bottomLeft: Radius.circular(14),
              bottomRight: Radius.circular(14),
            ),
            boxShadow: [
              BoxShadow(blurRadius: 16, color: Colors.black.withOpacity(.2)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              // Adicionando o widget PhoneNumberInput se for um campo de telefone e isPhoneField for true
              if (isPhoneField == true)
                InternationalPhoneNumberInput(
                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  ),
                  onInputChanged: (PhoneNumber number) {
                    // Executar alguma ação quando o número de telefone mudar
                  },
                  selectorTextStyle: TextStyle(color: Colors.black),
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,

                  initialValue: PhoneNumber(
                      isoCode: 'MZ'), // Definindo código do país padrão
                  textFieldController: textEditingController,
                  inputDecoration: InputDecoration(
                    hintText: placeholder,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
              // Adicionando um TextField padrão se não for um campo de telefone e isEmailField for true
              if (isEmailField == true)
                TextField(
                  obscureText: isPasswordField,
                  controller: textEditingController,
                  decoration: InputDecoration(
                    hintText: placeholder,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'[a-zA-Z0-9@.]+')),
                  ],
                  onChanged: (value) {
                    // Executar alguma ação quando o texto mudar
                  },
                ),
              // Adicionando um TextField padrão se não for um campo de telefone e isPhoneField for false ou null
              if (isPhoneField != true && isEmailField != true)
                TextField(
                  obscureText: isPasswordField,
                  controller: textEditingController,
                  decoration: InputDecoration(
                    hintText: placeholder,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                  ),
                  keyboardType: TextInputType.text,
                  inputFormatters: [],
                  onChanged: (value) {
                    // Executar alguma ação quando o texto mudar
                  },
                ),
              if (isDateField == true)
                InkWell(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: IgnorePointer(
                    child: TextField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                        hintText: placeholder,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null)
      textEditingController.text = DateFormat('yyyy-MM-dd').format(picked);
  }
}
