import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:mottu_marvel/presenter/character_presenter.dart';
import 'package:mottu_marvel/ui/page/character/character.dart';

import '../../usecase/usecase.dart';

CharacterPresenter makeGetXCharacterPresenter() {
  final remoteConfig = FirebaseRemoteConfig.instance;
  String publicKey, privateKey;

  publicKey = remoteConfig.getString("marvel_public_key");
  privateKey = remoteConfig.getString("marvel_private_key");

  return GetXCharacterPresenter(makeRemoteLoadCharacter(publicKey, privateKey));
}