import 'package:json_annotation/json_annotation.dart';

part 'joke_response.g.dart';

@JsonSerializable()
class JokesResponse {
  JokesResponse({
    this.total,
    this.result,
  });

  int? total;
  List<Result>? result;

  factory JokesResponse.fromJson(Map<String, dynamic> json) =>
      _$JokesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$JokesResponseToJson(this);
}

@JsonSerializable()
class Result {
  Result({
    this.categories,
    this.createdAt,
    this.iconUrl,
    this.id,
    this.updatedAt,
    this.url,
    this.value,
  });

  List<String>? categories;
  DateTime? createdAt;
  String? iconUrl;
  String? id;
  DateTime? updatedAt;
  String? url;
  String? value;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
