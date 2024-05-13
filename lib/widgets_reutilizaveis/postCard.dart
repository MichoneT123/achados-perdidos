import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perdidos_e_achados/models/item.dart';

class PostCard extends StatelessWidget {
  final Item item;

  PostCard({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 16,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.usuarioDTO!.primeiroNome ??
                                "Usuário Desconhecido",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Postado em: ${item.dataEhoraEncontradoOuPerdido?.toString() ?? 'Data Desconhecida'}",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width - 20,
                  child: Image.network(item.foto),
                ),
                Text(
                  item.nome,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  "Estado: ${item.estadoDeDevolucao}",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 10),
                Text(
                  "Categoria: ${item.categoriaDTO.nome}",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 10),
                Text(
                  "Localização: ${item.localizacaoDTO.nome}",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
