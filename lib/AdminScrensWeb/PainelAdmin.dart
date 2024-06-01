import 'package:flutter/material.dart';
import 'package:perdidos_e_achados/AdminScrensWeb/Dashboard.dart';

class paineladminScreen extends StatefulWidget {
  const paineladminScreen({Key? key}) : super(key: key);

  @override
  State<paineladminScreen> createState() => _paineladminScreenState();
}

class _paineladminScreenState extends State<paineladminScreen> {
  int _selectedIndex = 0;
  String _titleBarSelected = 'Dashboard';

  static List<Widget> _widgetOptions = [
    DashboardWidget(),
    Text("Itens"),
    Text("Criar usuário admin"),
    Text("Lista de Usuarios"),
    Text("Localizações"),
    Text("Categorias"),
  ];

  void _onItemTapped(int index, String title) {
    setState(() {
      _titleBarSelected = title;
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isWeb = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: Color.fromARGB(0, 255, 255, 255),
      body: Row(
        children: [
          if (isWeb)
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Cor da sombra
                    spreadRadius: 5, // Raio de difusão da sombra
                    blurRadius: 7, // Raio de desfoque da sombra
                    offset: Offset(
                        0, 3), // Deslocamento da sombra em relação ao contêiner
                  ),
                ],
              ),
              width: 380, // Largura do Drawer fixo
              child: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Text(
                        _titleBarSelected,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.dashboard),
                      title: const Text('Dashboard'),
                      onTap: () {
                        _onItemTapped(0, "Dashboard");
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.emoji_objects),
                      title: const Text('Itens'),
                      onTap: () {
                        _onItemTapped(1, "Itens");
                      },
                    ),
                    ExpansionTile(
                      leading: Icon(Icons.person),
                      title: const Text('Usuários'),
                      children: [
                        ListTile(
                          leading: Icon(Icons.add),
                          title: Text("Criar usuário admin"),
                          onTap: () {
                            _onItemTapped(2, "Criar usuário admin");
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.list),
                          title: Text("Lista de Usuarios"),
                          onTap: () {
                            _onItemTapped(3, "Lista de Usuarios");
                          },
                        ),
                      ],
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: const Text('Localizações'),
                      onTap: () {
                        _onItemTapped(4, "Localizações");
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.category),
                      title: const Text('Categorias'),
                      onTap: () {
                        _onItemTapped(5, "Categorias");
                      },
                    ),
                  ],
                ),
              ),
            ),
          Expanded(
            child: Center(
              child: _widgetOptions[_selectedIndex],
            ),
          ),
        ],
      ),
    );
  }
}
