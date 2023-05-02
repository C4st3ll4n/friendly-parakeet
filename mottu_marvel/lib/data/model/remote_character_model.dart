import 'package:mottu_marvel/domain/entity/character_entity.dart';

class RemoteCharacterModel {
  final int id;
  final String name;
  final String image;
  final String description;

  RemoteCharacterModel(this.id, this.name, this.image, this.description);

  factory RemoteCharacterModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(["id", "name", "description", "thumbnail"])) {
      throw Exception("One or more keys are missing");
    }

    String name, image_path, image_extension, image, description;
    int id;
    id = json['id'];
    name = json["name"];
    description = json["description"];

    image_path = json["thumbnail"]["path"];
    image_extension = json["thumbnail"]["extension"];
    image = "$image_path.$image_extension";

    return RemoteCharacterModel(id, name, image, description);
  }

  CharacterEntity toEntity() => CharacterEntity(id, name, image, description);
}
