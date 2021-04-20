import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

class Surah {
  int _ayahCount;
  String _name;
  int _index;
  Map<String, dynamic> _verses;
  String _surahPath;

  Surah(this._surahPath);

  Future<void> initSurah() async {
    String surah = await rootBundle.loadString(_surahPath);
    var decodedSurah = jsonDecode(surah);
    _ayahCount = decodedSurah['count'] as int;
    _verses = decodedSurah['verse'] as Map<String, dynamic>;
    _index = int.parse(decodedSurah['index']);
    _name = decodedSurah['name'] as String;
  }

  String get surahPath => _surahPath;

  Map<String, dynamic> get verses => _verses;

  int get index => _index;

  String get name => _name;

  int get ayahCount => _ayahCount;
}
