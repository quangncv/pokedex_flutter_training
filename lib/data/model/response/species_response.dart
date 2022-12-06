
import 'package:json_annotation/json_annotation.dart';

part 'species_response.g.dart';

@JsonSerializable()
class SpeciesResponse {
  @JsonKey(name: 'flavor_text_entries')
  List<FlavorTextEntry>? flavorTextEntries;
  @JsonKey(name: 'egg_groups')
  List<EggResponse>? eggGroups;
  @JsonKey(name: 'hatch_counter')
  int? hatchCounter;
  @JsonKey(name: 'gender_rate')
  int? genderRate;
  @JsonKey(name: 'habitat')
  HabitatResponse? habitat;
  @JsonKey(name: 'generation')
  GenerationResponse? generation;
  @JsonKey(name: 'capture_rate')
  int? captureRate;
  @JsonKey(name: 'evolution_chain')
  EvolutionChainResponse? evolutionChain;

  SpeciesResponse({this.flavorTextEntries});

  factory SpeciesResponse.fromJson(Map<String, dynamic> json) => _$SpeciesResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$SpeciesResponseToJson(this);

  String? getDesc() {
    final flavorTextEntry = flavorTextEntries?.firstWhere((element) => element.language?.name == 'en' && element.version?.name == 'ruby');
    return flavorTextEntry?.flavorText?.replaceAll('\n', ' ');
  }
}

@JsonSerializable()
class FlavorTextEntry {
  @JsonKey(name: 'flavor_text')
  String? flavorText;
  @JsonKey(name: 'language')
  FlavorTextEntryLanguage? language;
  @JsonKey(name: 'version')
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

@JsonSerializable()
class EggResponse {
  @JsonKey(name: 'name')
  String? name;

  EggResponse({this.name});

  factory EggResponse.fromJson(Map<String, dynamic> json) => _$EggResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$EggResponseToJson(this);
}

@JsonSerializable()
class HabitatResponse {
  @JsonKey(name: 'name')
  String? name;

  HabitatResponse({this.name});

  factory HabitatResponse.fromJson(Map<String, dynamic> json) => _$HabitatResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$HabitatResponseToJson(this);
}

@JsonSerializable()
class GenerationResponse {
  @JsonKey(name: 'name')
  String? name;

  GenerationResponse({this.name});

  factory GenerationResponse.fromJson(Map<String, dynamic> json) => _$GenerationResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$GenerationResponseToJson(this);
}

@JsonSerializable()
class EvolutionChainResponse {
  @JsonKey(name: 'url')
  String? url;

  EvolutionChainResponse({this.url});

  factory EvolutionChainResponse.fromJson(Map<String, dynamic> json) => _$EvolutionChainResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$EvolutionChainResponseToJson(this);
}