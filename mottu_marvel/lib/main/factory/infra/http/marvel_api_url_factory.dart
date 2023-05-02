String makeAPIUrl({required String path, required String key,
required timestamp, required hash})
=> "https://gateway.marvel.com/v1/public/$path?apikey=$key&hash=$hash&ts=$timestamp";
