import 'package:mottu_marvel/domain/entity/entities.dart';

abstract class CharacterPresenter{
  Stream<List<CharacterEntity>> get characterStream;

  Future<void> loadData();

  void goToCharacterDetails(String id);
}