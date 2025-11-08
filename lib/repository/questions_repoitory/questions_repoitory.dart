import 'package:questioner/models/models.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class QuestionsRepoitory {
  final String opendbUrl = 'https://opentdb.com/api.php?';
  final String defaultText = 'amount=10&type=multiple';

  TriviaResponse? _currentTest;

  Future<TriviaResponse> getTest() async {
    if (_currentTest != null) {
      return _currentTest!;
    }

    final url = Uri.parse('https://opentdb.com/api.php?$defaultText');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return TriviaResponse.fromJson(jsonData);
    } else {
      throw Exception('Ошибка при загрузке данных: ${response.statusCode}');
    }
  }

  void clear() {
    _currentTest = null;
    return;
  }



}
