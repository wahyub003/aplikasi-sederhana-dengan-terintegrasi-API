import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:tugas/models/user_model.dart';

class ApiService {
  static const String baseUrl = 'https://reqres.in/api';

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<User> fetchUserById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$id'));
    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body)['data'];
      return User.fromJson(data);
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<void> createUser(String name, String job) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      body: jsonEncode({
        'name': name,
        'job': job,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    log('Response status: ${response.statusCode}');
    log('Response body: ${response.body}');

    if (response.statusCode != 201) {
      throw Exception('Failed to create user');
    }
  }
}
