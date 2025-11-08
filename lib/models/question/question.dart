
class TriviaResponse {
  final int responseCode;
  final List<Question> results;

  TriviaResponse({
    required this.responseCode,
    required this.results,
  });

  factory TriviaResponse.fromJson(Map<String, dynamic> json) {
    return TriviaResponse(
      responseCode: json['response_code'],
      results: (json['results'] as List)
          .map((e) => Question.fromJson(e))
          .toList(),
    );
  }
}

class Question {
  final String type;
  final String difficulty;
  final String category;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;

  Question({
    required this.type,
    required this.difficulty,
    required this.category,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      type: json['type'],
      difficulty: json['difficulty'],
      category: json['category'],
      question: json['question'],
      correctAnswer: json['correct_answer'],
      incorrectAnswers:
          List<String>.from(json['incorrect_answers'] as List),
    );
  }
}
