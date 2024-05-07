part of remote;

class RemoteFkImplementation implements IRemote {
  @override
  Future delete(
      {required String query,
      required Map<String, String> header,
      body,
      Map<String, Object?>? debugData}) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      if (debugData == null) {
        throw const FetchDataException("erro");
      }
      return debugData;
    } on Exception catch (e) {
      throw FetchDataException('$e');
    }
  }

  @override
  Future get(
      {required String query,
      required Map<String, String> header,
      Map<String, Object?>? debugData}) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      if (debugData == null) {
        throw const FetchDataException("erro");
      }
      return debugData;
    } on Exception catch (e) {
      throw FetchDataException('$e');
    }
  }

  @override
  Future patch(
      {required String query,
      required Map<String, String> header,
      body,
      Map<String, Object?>? debugData}) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      if (debugData == null) {
        throw const FetchDataException("erro");
      }
      return debugData;
    } on Exception catch (e) {
      throw FetchDataException('$e');
    }
  }

  @override
  Future post(
      {required String query,
      required Map<String, String> header,
      body,
      Map<String, Object?>? debugData}) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      if (debugData == null) {
        throw const FetchDataException("erro");
      }
      return debugData;
    } on Exception catch (e) {
      throw FetchDataException('$e');
    }
  }

  @override
  Future put(
      {required String query,
      required Map<String, String> header,
      body,
      Map<String, Object?>? debugData}) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      if (debugData == null) {
        throw const FetchDataException("erro");
      }
      return debugData;
    } on Exception catch (e) {
      throw FetchDataException('$e');
    }
  }

  @override
  Map<String, dynamic> returnResponse(Response response) {
    throw UnimplementedError();
  }
}
