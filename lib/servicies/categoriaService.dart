import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:perdidos_e_achados/Environments.dart';
import 'package:perdidos_e_achados/models/categoria.dart';
import 'package:perdidos_e_achados/servicies/tokenService.dart';

class categoriaService {
  Future<List<CategoriaDTO>?> CategoriaDTOFeed() async {
    String? authToken = await AuthService().getToken();
    final url = Uri.parse('$ApiUrl/categorias');

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken',
        },
      );

      if (response.statusCode == 200) {
        final dynamic responseData = jsonDecode(response.body);

        if (responseData is List) {
          final List<CategoriaDTO> CategoriaDTOs = responseData
              .map((CategoriaDTOData) => CategoriaDTO.fromJson(
                  CategoriaDTOData as Map<String, dynamic>))
              .toList();

          CategoriaDTOs.forEach(
            (element) {
              print(element.nome);
            },
          );

          print('Listing CategoriaDTOs successful');
          return CategoriaDTOs;
        } else {
          print('Error: Response data is not a list');
          return null;
        }
      } else {
        print(
            'Listing CategoriaDTOs failed (status code: ${response.statusCode})');
        print(response.body);
        return null;
      }
    } catch (e) {
      print('Error fetching CategoriaDTOs: $e');
      return null;
    }
  }
}
