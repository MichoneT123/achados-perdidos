import 'dart:convert';

import 'package:perdidos_e_achados/Enviroments.dart';
import 'package:perdidos_e_achados/models/localizacao.dart';
import 'package:perdidos_e_achados/servicies/tokenService.dart';
import 'package:http/http.dart' as http;

class localizacaoService {
  Future<List<LocalizacaoDTO>?> LocalizacaoDTOFeed() async {
    String? authToken = await AuthService().getToken();
    final url = Uri.parse('$ApiUrl/localizacoes');

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
          final List<LocalizacaoDTO> LocalizacaoDTOs = responseData
              .map((LocalizacaoDTOData) => LocalizacaoDTO.fromJson(
                  LocalizacaoDTOData as Map<String, dynamic>))
              .toList();

          print('Listing LocalizacaoDTOs successful');
          return LocalizacaoDTOs;
        } else {
          print('Error: Response data is not a list');
          return null;
        }
      } else {
        print(
            'Listing LocalizacaoDTOs failed (status code: ${response.statusCode})');
        print(response.body);
        return null;
      }
    } catch (e) {
      print('Error fetching LocalizacaoDTOs: $e');
      return null;
    }
  }
}
