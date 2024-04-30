import 'package:achadosapi/models/user.dart';

class AuthenticationService {
  // Simulação de banco de dados de usuários
  static List<User> _users = [];

  // Método para registrar um novo usuário
  Future<void> registerUser(User newUser) async {
    // Verifica se o email já está em uso
    if (_users.any((user) => user.email == newUser.email)) {
      throw Exception('Email already in use');
    }

    // Adiciona o novo usuário à lista
    _users.add(newUser);
  }

  // Método para fazer login
  Future<User?> loginUser(String email, String password) async {
    // Procura o usuário com o email fornecido
    final user = _users.firstWhere((user) => user.email == email, orElse: () => null);

    // Verifica se o usuário foi encontrado e se a senha está correta
    if (user != null && user.password == password) {
      return user;
    } else {
      return null;
    }
  }
}
