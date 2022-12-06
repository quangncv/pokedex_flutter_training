import 'package:json_annotation/json_annotation.dart';

part 'page_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PageResponse<T> {
  @JsonKey(name: 'results')
  final List<T> results;

  PageResponse({required this.results});

  factory PageResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$PageResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$PageResponseToJson(this, toJsonT);
}