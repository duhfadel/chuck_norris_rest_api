// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JokesResponse _$JokesResponseFromJson(Map<String, dynamic> json) =>
    JokesResponse(
      total: json['total'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$JokesResponseToJson(JokesResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      iconUrl: json['iconUrl'] as String?,
      id: json['id'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      url: json['url'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'categories': instance.categories,
      'createdAt': instance.createdAt?.toIso8601String(),
      'iconUrl': instance.iconUrl,
      'id': instance.id,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'url': instance.url,
      'value': instance.value,
    };
