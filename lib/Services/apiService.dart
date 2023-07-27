import 'dart:convert';

import '../Models/CharacterModel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = "http://api.duckduckgo.com/";



  Future<List<Character>> fetchSimpsonsCharacters() async {
    final response = await http.get(Uri.parse("$_baseUrl?q=simpsons+characters&format=json"));

    if (response.statusCode == 200) {
      List<dynamic> results = jsonDecode(response.body)['RelatedTopics'];

      return results.map((json) {
        List<String> parts = json['Text'].split(' - ');
        String title = parts.length > 0 ? parts[0] : '';
        String description = parts.length > 1 ? parts[1] : '';
        String iconUrl = json['Icon']['URL'] as String;
        String image = iconUrl.isNotEmpty ? json['FirstURL']+"/" + iconUrl : '';
       return Character(
         title: title,
         description: description,
         imageUrl: image,
       );

      }).toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }

  Future<List<Character>> fetchWireCharacters() async {
    final response = await http.get(Uri.parse("$_baseUrl?q=the+wire+characters&format=json"));

    if (response.statusCode == 200) {
      List<dynamic> results = jsonDecode(response.body)['RelatedTopics'];

      return results.map((json) {
        List<String> parts = json['Text'].split(' - ');
        String title = parts.length > 0 ? parts[0] : '';
        String description = parts.length > 1 ? parts[1] : '';
        String iconUrl = json['Icon']['URL'] as String;
        String image = iconUrl.isNotEmpty ? json['FirstURL'] + iconUrl : '';
        return Character(
          title: title,
          description: description,
          imageUrl: image,
        );

      }).toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
