import 'package:get/get.dart';
import 'package:mottu_marvel/domain/entity/character_entity.dart';
import 'package:mottu_marvel/domain/usecase/usecases.dart';
import 'package:mottu_marvel/ui/page/character/character.dart';

class GetXCharacterPresenter extends GetxController
    implements CharacterPresenter {
  GetXCharacterPresenter(this.usecase);

  final _dataStream = RxList<CharacterEntity>();
  final LoadCharacters usecase;

  @override
  Stream<List<CharacterEntity>> get characterStream => _dataStream.stream;

  @override
  void goToCharacterDetails(String id) {
    // TODO: implement goToCharacterDetails
  }

  @override
  Future<void> loadData() async{
    try {
      final result = await usecase.load();
      _dataStream.addAll(result);
    } catch (e) {
      _dataStream.subject.addError(e, StackTrace.empty);
    }
  }
}
