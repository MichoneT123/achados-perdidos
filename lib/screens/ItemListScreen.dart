import 'package:flutter/material.dart';
import 'package:perdidos_e_achados/models/categoria.dart';
import 'package:perdidos_e_achados/models/estado.dart';
import 'package:perdidos_e_achados/models/item.dart';
import 'package:perdidos_e_achados/models/localizacao.dart';
import 'package:perdidos_e_achados/models/usuario.dart';
import 'package:perdidos_e_achados/screens/details_item_screen.dart';
import 'package:perdidos_e_achados/servicies/itemService.dart';
import 'package:perdidos_e_achados/widgets_reutilizaveis/cardItem.dart';

class ItemListScreen extends StatefulWidget {
  const ItemListScreen({Key? key}) : super(key: key);

  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  List<Item>? itens = [];
  late List<Item>? _itensFiltrados = [];
  String _pesquisa = '';

  @override
  void initState() {
    super.initState();

    _fetchItems();
    _itensFiltrados = itens!;
  }

  void _filtrarItens(String estado, String pesquisa) {
    setState(() {
      _itensFiltrados = itens!.where((item) {
        final nomeItem = item.nome.toLowerCase();
        final pesquisaLower = pesquisa.toLowerCase();
        return item.estadoDeDevolucao == estado &&
            (pesquisa.isEmpty || nomeItem.contains(pesquisaLower));
      }).toList();
    });
  }

  void _fetchItems() async {
    final fetchedItems = await ItemService().itensUsuarioLogado();
    setState(() {
      itens = fetchedItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Meus Itens',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                DropdownButton<String>(
                  value: 'Todos',
                  onChanged: (value) {
                    if (value == 'Todos') {
                      setState(() {
                        _itensFiltrados = itens!;
                      });
                    } else {
                      _filtrarItens(value!, _pesquisa);
                    }
                  },
                  items: <String>['Todos', 'NAO_DEVOLVIDO']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _pesquisa = value;
                          _filtrarItens('Todos', _pesquisa);
                        });
                      },
                      decoration: InputDecoration(
                        label: Text('Pesquisar'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          itens == null
              ? Center(child: Text("Sem itens"))
              : Expanded(
                  child: ListView.builder(
                    itemCount: itens!.length,
                    itemBuilder: (context, index) {
                      final item = itens![index];
                      return CardItem(
                        item: item,
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
