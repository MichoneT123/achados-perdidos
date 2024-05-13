import 'package:flutter/material.dart';
import 'package:perdidos_e_achados/models/item.dart';
import 'package:perdidos_e_achados/screens/details_item_screen.dart';
import 'package:perdidos_e_achados/servicies/itemService.dart';
import 'package:perdidos_e_achados/widgets_reutilizaveis/postCard.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<Item>? itens = [];
  late List<Item>? _itensFiltrados = [];
  String _pesquisa = '';

  @override
  void initState() {
    super.initState();

    _fetchitens();
  }

  void _fetchitens() async {
    final fetcheditens = await ItemService().itemFeed();

    setState(() {
      itens = fetcheditens;
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [],
            ),
          ),
          itens == null
              ? Center(child: Text("Sem itens"))
              : Expanded(
                  child: ListView.builder(
                    itemCount: itens!.length,
                    itemBuilder: (context, index) {
                      final item = itens![index];
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ItemDetailsScreen(item: item),
                                ));
                          },
                          child: PostCard(item: item));
                    },
                  ),
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/add_item");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
