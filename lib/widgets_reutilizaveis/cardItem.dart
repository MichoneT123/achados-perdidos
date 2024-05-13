import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perdidos_e_achados/models/item.dart';
import 'package:perdidos_e_achados/screens/details_item_screen.dart';
import 'package:perdidos_e_achados/servicies/itemService.dart';

class CardItem extends StatelessWidget {
  final Item item;
  const CardItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final avatar =
        item.usuarioDTO?.foto != null || item.usuarioDTO!.foto!.isEmpty
            ? CircleAvatar(
                backgroundImage: NetworkImage(item.foto),
              )
            : const CircleAvatar(
                child: Icon(Icons.person),
              );
    return ListTile(
        leading: avatar,
        title: Text(item.nome),
        subtitle: Text('Estado: ${item.estadoDTO.nome}'),
        trailing: Container(
          width: 145,
          child: Row(
            children: <Widget>[
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                    color: Colors.orange,
                  )),
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
                              try {
                                int? status =
                                    await ItemService().delete(item.id!);
                                if (status == 200) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Item apagado.'),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Item nao apagado'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                                Navigator.of(context).pop();
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Item nao apagado'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                              ;
                            },
                            child: Text("Nao"),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              Navigator.of(context).pop();
                              await ItemService().delete(item.id!);
                            },
                            child: Text("Sim"),
                          )
                        ],
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemDetailsScreen(item: item),
                        ));
                  },
                  icon: Icon(
                    Icons.remove_red_eye_sharp,
                    color: Colors.green,
                  ))
            ],
          ),
        ));
  }
}
