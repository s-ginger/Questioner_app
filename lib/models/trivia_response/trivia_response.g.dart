// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trivia_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TriviaResponse _$TriviaResponseFromJson(Map<String, dynamic> json) =>
    TriviaResponse(
      responseCode: (json['response_code'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TriviaResponseToJson(TriviaResponse instance) =>
    <String, dynamic>{
      'response_code': instance.responseCode,
      'results': instance.results,
    };
