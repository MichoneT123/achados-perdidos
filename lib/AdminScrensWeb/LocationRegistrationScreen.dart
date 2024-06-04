import 'package:flutter/material.dart';
import 'package:perdidos_e_achados/models/categoria.dart';
import 'package:perdidos_e_achados/models/localizacao.dart';
import 'package:perdidos_e_achados/servicies/localizacaoService.dart';
import 'package:perdidos_e_achados/widgets_reutilizaveis/MyInputField.dart';

class LocationRegistrationScreen extends StatefulWidget {
  @override
  _LocationRegistrationScreenState createState() =>
      _LocationRegistrationScreenState();
}

class _LocationRegistrationScreenState
    extends State<LocationRegistrationScreen> {
  final TextEditingController _locationController = TextEditingController();
  List<LocalizacaoDTO>? localizacaoDTOs = [];
  bool _isLoading = false;
  String? nome;

  @override
  void initState() {
    super.initState();
    _fetchLocalizacoes();
  }

  void _fetchLocalizacoes() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final fetchedLocalizacoes =
          await localizacaoService().LocalizacaoDTOFeed();
      setState(() {
        localizacaoDTOs = fetchedLocalizacoes;
        _isLoading = false;
      });
    } catch (e) {
      print('Erro ao buscar localizações: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _addLocalizacao() async {
    try {
      setState(() {
        nome = _locationController.text;
      });
      await localizacaoService()
          .registerLocalizacao(LocalizacaoDTO(nome: nome));
      _fetchLocalizacoes();
    } catch (e) {
      print(e);
    }
  }

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
                    textEditingController: _locationController,
                    label: "Localização",
                    isPasswordField: false,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: _addLocalizacao,
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
            const SizedBox(width: 20),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : DataTable(
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
                        columnSpacing: 32.0,
                        dataTextStyle: TextStyle(fontSize: 16.0),
                        columns: const [
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
                          DataColumn(
                            label: Text(
                              'Ações',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                        rows: localizacaoDTOs!.map((categoria) {
                          return DataRow(cells: [
                            DataCell(Text(categoria.nome ?? '')),
                            DataCell(Text(categoria.id.toString())),
                            DataCell(Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.orange,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text("Excluir"),
                                        content: const Text(
                                          "Tem certeza?",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () async {
                                              int? status =
                                                  5; // Update this with the real status from your delete operation
                                              if (status == 204) {
                                                Navigator.of(context).pop();
                                                Navigator.pushNamed(
                                                    context, '/my-items');
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content:
                                                        Text('Item apagado.'),
                                                    backgroundColor:
                                                        Colors.green,
                                                  ),
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                        'Item não apagado'),
                                                    backgroundColor: Colors.red,
                                                  ),
                                                );
                                              }
                                            },
                                            child: Text("Sim"),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Não"),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.remove_red_eye_sharp,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            )),
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
