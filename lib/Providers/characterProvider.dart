import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

import '../Models/CharacterModel.dart';
import '../Services/apiService.dart';


class CharacterProvider with ChangeNotifier {
  List<Character> _characters = [];
  final ApiService _apiService = ApiService();

  List<Character> get characters => _characters;

  Character? selectedCharacter;

  void selectCharacter(Character character) {
    selectedCharacter = character;
    notifyListeners();
  }

  Future<void> fetchCharacters() async {
    try {
      print('dfsd');
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String packageName = packageInfo.packageName;
      if (kDebugMode) {
        print(packageName);
      }

      if (packageName == 'com.sample.simpsonsviewer') {
        _characters = await _apiService.fetchSimpsonsCharacters();
      } else if (packageName == 'com.sample.wireviewer') {
        _characters = await _apiService.fetchWireCharacters();
      } else {
        // default or error handling
      }

      notifyListeners();
    } catch (e) {
      // handle error
      print(e);
    }
  }
}

