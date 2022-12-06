import 'package:json_annotation/json_annotation.dart';

part 'ability_detail_response.g.dart';

@JsonSerializable()
class AbilityDetailResponse {
  @JsonKey(name: 'flavor_text_entries')
  List<FlavorTextEntry>? flavorTextEntries;

  AbilityDetailResponse({this.flavorTextEntries});

  factory AbilityDetailResponse.fromJson(Map<String, dynamic> json) => _$AbilityDetailResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$AbilityDetailResponseToJson(this);

  String? getDesc() {
    final flavorTextEntry = flavorTextEntries?.firstWhere((element) => element.language?.name == 'en' && element.version?.name == 'omega-ruby-alpha-sapphire');
    return flavorTextEntry?.flavorText?.replaceAll('\n', ' ');
  }
}

@JsonSerializable()
class FlavorTextEntry {
  @JsonKey(name: 'flavor_text')
  String? flavorText;
  @JsonKey(name: 'language')
  FlavorTextEntryLanguage? language;
  @JsonKey(name: 'version_group')
  FlavorTextEntryVersion? version;

  FlavorTextEntry({this.flavorText, this.language, this.version});

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) => _$FlavorTextEntryFromJson(json);
  Map<String, dynamic> toJson() =>_$FlavorTextEntryToJson(this);
}

@JsonSerializable()
class FlavorTextEntryLanguage {
  @JsonKey(name: 'name')
  String? name;

  FlavorTextEntryLanguage({this.name});

  factory FlavorTextEntryLanguage.fromJson(Map<String, dynamic> json) => _$FlavorTextEntryLanguageFromJson(json);
  Map<String, dynamic> toJson() =>_$FlavorTextEntryLanguageToJson(this);
}

@JsonSerializable()
class FlavorTextEntryVersion {
  @JsonKey(name: 'name')
  String? name;

  FlavorTextEntryVersion({this.name});

  factory FlavorTextEntryVersion.fromJson(Map<String, dynamic> json) => _$FlavorTextEntryVersionFromJson(json);
  Map<String, dynamic> toJson() =>_$FlavorTextEntryVersionToJson(this);
}