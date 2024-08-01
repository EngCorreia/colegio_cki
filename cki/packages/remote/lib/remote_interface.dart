part of 'remote.dart';

abstract class IRemote {
  Future get(
      {required String query,
      required Map<String, String> header,
      Map<String, Object?>? debugData});
  Future post(
      {required String query,
      required Map<String, String> header,
      dynamic body,
      Map<String, Object?>? debugData});
  Future patch(
      {required String query,
      required Map<String, String> header,
      dynamic body,
      Map<String, Object?>? debugData});
  Future put(
      {required String query,
      required Map<String, String> header,
      dynamic body,
      Map<String, Object?>? debugData});
  Future delete(
      {required String query,
      required Map<String, String> header,
      dynamic body,
      Map<String, Object?>? debugData});
  Map<String, dynamic> returnResponse(Response response);
}
