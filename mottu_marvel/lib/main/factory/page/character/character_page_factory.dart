import 'package:mottu_marvel/main/factory/page/character/getx_character_presenter_factory.dart';
import 'package:mottu_marvel/ui/page/character/character.dart';

CharacterPage makeCharacterPage() => CharacterPage(presenter: makeGetXCharacterPresenter());