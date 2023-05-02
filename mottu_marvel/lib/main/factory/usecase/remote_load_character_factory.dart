import 'dart:convert';
import 'package:crypto/crypto.dart';

import 'package:mottu_marvel/data/usecase/usecases.dart';
import 'package:mottu_marvel/domain/usecase/usecases.dart';

import '../infra/http/http.dart';

LoadCharacters makeRemoteLoadCharacter(String publicKey, String privateKey) {
  String ts = DateTime.now().toString();
  String hash = generateMd5("$ts$privateKey$publicKey");
  print("$ts -- $hash");
  return RemoteLoadCharacters(
    makeHttpAdapter(),
    makeAPIUrl(
      path: "characters",
      key: publicKey,
      timestamp: ts,
      hash: hash,
    ),
  );
}

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}
