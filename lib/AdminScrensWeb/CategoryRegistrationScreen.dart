import 'package:flutter/material.dart';
import 'package:perdidos_e_achados/models/categoria.dart';
import 'package:perdidos_e_achados/widgets_reutilizaveis/MyInputField.dart'; // Importe o modelo Categoria

class CategoryRegistrationScreen extends StatefulWidget {
  @override
  _CategoryRegistrationScreenState createState() =>
      _CategoryRegistrationScreenState();
}

class _CategoryRegistrationScreenState
    extends State<CategoryRegistrationScreen> {
  final List<CategoriaDTO> categories = []; // Lista de categorias
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyInputField(
                    placeholder: "Nome da Localização",
                    textEditingController: _nameController,
                    label: "Localização",
                    isPasswordField: false,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    //onTap: _addLocalizacao,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14),
                          bottomLeft: Radius.circular(14),
                          bottomRight: Radius.circular(14),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Registrar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: DataTable(
                  // Add border decoration
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(14),
                      bottomLeft: Radius.circular(14),
                      bottomRight: Radius.circular(14),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 16,
                        color: Colors.black.withOpacity(.2),
                      ),
                    ],
                  ),
                  columnSpacing: 32.0, // Add spacing between columns
                  dataTextStyle: TextStyle(fontSize: 16.0), // Adjust font size
                  columns: [
                    DataColumn(
                      label: Text(
                        'Nome',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'ID',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                  rows: categories.map((categoria) {
                    return DataRow(cells: [
                      DataCell(Text(categoria.nome ?? '')),
                      DataCell(Text(categoria.id.toString())),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
