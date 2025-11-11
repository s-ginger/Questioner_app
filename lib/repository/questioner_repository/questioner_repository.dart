import 'package:questioner/models/models.dart';

class QuestionerRepository {
  TriviaResponse? _currentTest;

  int _currentIndex = 0;
  List<bool> _correctList = [];

  // Сколько вопросов загружено
  int get totalQuestions => _currentTest?.results.length ?? 0;

  // Текущий индекс
  int get index => _currentIndex;

  // Текущий вопрос
  Question? get currentQuestion {
    if (_currentTest == null || _currentIndex >= totalQuestions) {
      return null;
    }
    return _currentTest!.results[_currentIndex];
  }

  // Устанавливаем тест (из API)
  void setTest(TriviaResponse test) {
    _currentTest = test;
    _correctList = [];
    _currentIndex = 0;
  }

  // Следующий вопрос
  bool next() {
    if (_currentIndex + 1 < totalQuestions) {
      _currentIndex++;
      return true;
    }
    return false; // вопросов больше нет
  }

  // Предыдущий вопрос
  bool previous() {
    if (_currentIndex - 1 >= 0) {
      _currentIndex--;
      return true;
    }
    return false;
  }

  // Проверка ответа
  bool isCorrect(String answer) {
    if (currentQuestion?.correctAnswer == answer) {
        _correctList.add(true);
        return true;
    }
    _correctList.add(false);
    return false;
  }

  

}
