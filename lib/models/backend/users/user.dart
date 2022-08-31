import '../../api-client/api_model.dart';

/// Recurso que representa los usuarios
class User implements ApiModel {
  final String email;
  final String name;


  User({
    required this.email,
    required this.name,
  });

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  static List<User> fromJsonList(List<dynamic> jsonList) {
    List<User> objects = [];
    for (var json in jsonList) {
      objects.add(User.fromJson(json));
    }
    return objects;
  }

  @override
  String toString() {
    return 'User{email: $email, nombre: $name}';
  }
}
