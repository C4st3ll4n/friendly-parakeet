import 'package:mottu_marvel/domain/entity/character_entity.dart';

class RemoteCharacterModel {
  final String name;
  final String image;
  final String description;

  RemoteCharacterModel(this.name, this.image, this.description);

  factory RemoteCharacterModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll([""])) {
      throw Exception("One or more keys are missing");
    }

    String name, image, description;
    name = json["name"];
    image = json["image"];
    description = json["description"];

    return RemoteCharacterModel(name, image, description);
  }

  CharacterEntity toEntity() => CharacterEntity(name, image, description);
}
