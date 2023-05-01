import 'package:mottu_marvel/domain/entity/entities.dart';

abstract class LoadCharacters{
  Future<List<CharacterEntity>> load();
}