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
      final data = response['data']['results'];
      print("response => $data");

      return data
          .map<CharacterEntity>((json) {
            return RemoteCharacterModel.fromJson(json).toEntity();
          })
          .toList();

    }on HttpError catch(he){
      throw Exception("Deu http ruim");
    }
  }

}