class AppExceptions implements Exception {
  final String? _prefix;
  final String? _message;

  AppExceptions([this._prefix, this._message]);

  @override
  String toString() {
    return '$_prefix $_message';
  }
}

class InternalException extends AppExceptions {
  InternalException([String? message]) : super('Internal Exception: ', message);
}

class FileNotFoundException extends AppExceptions {
  FileNotFoundException([String? message]) : super('File Not Found: ', message);
}

class JsonParsingException extends AppExceptions {
  JsonParsingException([String? message]) : super('JSON Parsing Error: ', message);
}

class AssetLoadException extends AppExceptions {
  AssetLoadException([String? message]) : super('Asset Load Error: ', message);
}