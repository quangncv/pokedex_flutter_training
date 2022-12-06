
import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_app/data/model/pokemon.dart';

part 'evolution_response.g.dart';

@JsonSerializable()
class EvolutionResponse {
  @JsonKey(name: 'chain')
  ChainResponse chain;

  EvolutionResponse(this.chain);

  factory EvolutionResponse.fromJson(Map<String, dynamic> json) =>
      _$EvolutionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionResponseToJson(this);

  List<Evolution> toEvolutionModel() {
    final List<Evolution> evolutions = [];

    getEvolution(evolutions, chain);

    return evolutions;
  }

  void getEvolution(List<Evolution> evolutions, ChainResponse chain) {
    if (chain.evolvesTo?.isNotEmpty == true) {
      chain.evolvesTo?.forEach((element) {
        final pathSplit = chain.species?.url?.split('/');
        final id = pathSplit?[pathSplit.length - 2];

        final evolvesToPathSplit = element.species?.url?.split('/');
        final evolvesId = evolvesToPathSplit?[evolvesToPathSplit.length - 2];

        final Evolution evolution = Evolution(
          int.parse(id.toString()),
          chain.species?.name ?? '',
          int.parse(evolvesId.toString()),
          element.species?.name ?? '',
          element.evolutionDetails?.map((e) => e.minLv).toList() ?? [],
          element.evolutionDetails?.map((e) => e.trigger?.name).toList() ?? [],
          element.evolutionDetails?.map((e) => e.item?.name).toList() ?? [],
          element.evolutionDetails?.map((e) => e.minHappiness).toList() ?? [],
          element.evolutionDetails?.map((e) => e.timeOfDay).toList() ?? [],
          element.evolutionDetails?.map((e) => e.knownMoveType?.name).toList() ?? [],
        );
        evolutions.add(evolution);

        if (element.evolvesTo?.isNotEmpty == true) {
          getEvolution(evolutions, element);
        }
      });
    }
  }
}

@JsonSerializable()
class ChainResponse {
  @JsonKey(name: 'evolution_details')
  List<EvolutionDetailResponse>? evolutionDetails;
  @JsonKey(name: 'evolves_to')
  List<ChainResponse>? evolvesTo;
  @JsonKey(name: 'species')
  SpeciesEvolutionResponse? species;

  ChainResponse({this.evolutionDetails, this.evolvesTo, this.species});

  factory ChainResponse.fromJson(Map<String, dynamic> json) =>
      _$ChainResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChainResponseToJson(this);
}

@JsonSerializable()
class EvolutionDetailResponse {
  @JsonKey(name: 'min_level')
  int? minLv;
  @JsonKey(name: 'trigger')
  TriggerResponse? trigger;
  @JsonKey(name: 'item')
  ItemEvolutionResponse? item;
  @JsonKey(name: 'min_happiness')
  int? minHappiness;
  @JsonKey(name: 'time_of_day')
  String? timeOfDay;
  @JsonKey(name: 'known_move_type')
  KnownMoveTypeResponse? knownMoveType;

  EvolutionDetailResponse({this.minLv, this.trigger, this.item});

  factory EvolutionDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$EvolutionDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionDetailResponseToJson(this);
}

@JsonSerializable()
class SpeciesEvolutionResponse {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'url')
  String? url;

  SpeciesEvolutionResponse({this.name, this.url});

  factory SpeciesEvolutionResponse.fromJson(Map<String, dynamic> json) =>
      _$SpeciesEvolutionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SpeciesEvolutionResponseToJson(this);
}

@JsonSerializable()
class TriggerResponse {
  @JsonKey(name: 'name')
  String name;

  TriggerResponse(this.name);

  factory TriggerResponse.fromJson(Map<String, dynamic> json) =>
      _$TriggerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TriggerResponseToJson(this);
}

@JsonSerializable()
class ItemEvolutionResponse {
  @JsonKey(name: 'name')
  String name;

  ItemEvolutionResponse(this.name);

  factory ItemEvolutionResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemEvolutionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ItemEvolutionResponseToJson(this);
}

@JsonSerializable()
class KnownMoveTypeResponse {
  @JsonKey(name: 'name')
  String name;

  KnownMoveTypeResponse(this.name);

  factory KnownMoveTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$KnownMoveTypeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$KnownMoveTypeResponseToJson(this);
}
