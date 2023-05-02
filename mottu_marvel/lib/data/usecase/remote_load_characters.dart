import 'package:mottu_marvel/data/infra/http/http.dart';
import 'package:mottu_marvel/data/model/remote_character_model.dart';
import 'package:mottu_marvel/domain/entity/character_entity.dart';
import 'package:mottu_marvel/domain/usecase/load_characters.dart';

class RemoteLoadCharacters implements LoadCharacters{
  final HttpClient httpClient;
  final String url;

  RemoteLoadCharacters(this.httpClient, this.url);

  @override
  Future<List<CharacterEntity>> load() async {
    try{
      final response = await httpClient.request(url: url, method: "get");
      return response
          .map<CharacterEntity>((json) => RemoteCharacterModel.fromJson(json).toEntity())
          .toList();

    }on HttpError{
      throw Exception("Deu http ruim");
    }
    catch(e){
      throw Exception("Deu ruim");
    }

    return [];
  }

}