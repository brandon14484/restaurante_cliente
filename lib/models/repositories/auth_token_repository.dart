import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Repositorio que almacena, lee y elimina un Token de autenticación en el
/// sistema de almacenamiento local, usando [SharedPreferences.getInstance].
class AuthTokenRepository {
  static const String _storageTokenKey = "auth_token";

  AuthTokenRepository();

  Future<void> saveToken(String token) async {
    final storage = await SharedPreferences.getInstance();
    storage.setString(_storageTokenKey, token);
    debugPrint("Token $token establecido correctamente");
  }

  Future<String?> getToken() async {
    final storage = await SharedPreferences.getInstance();
    final token = storage.getString(_storageTokenKey);
    debugPrint("Obteniendo Token $token");
    return token;
  }

  Future<void> deleteToken() async {
    final storage = await SharedPreferences.getInstance();
    storage.remove(_storageTokenKey);
    debugPrint("Token eliminado correctamente");
  }
}
