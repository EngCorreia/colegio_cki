part of local;

class LocalStorageFkImplementation implements ILocalStorage {

  @override
  Future<bool> clear({bool? debugData}) async {
   if (debugData == null) {
        throw const CachedException("erro");
      }
      return debugData;
  }

  @override
  Future get({required String key, Map<String, Object?>? debugData}) async {
   if (debugData == null) {
        throw const CachedException("erro");
      }
  
    return jsonEncode(debugData);
  }

  @override
  Future<bool> delete(
      {required String key, bool? debugData}) async {
    if (debugData == null) {
        throw const CachedException("erro");
      }
      return debugData;
  }

  @override
  Future<bool> put(
      {required String key,
      required dynamic value,
      bool? debugData}) async {
    if (debugData == null) {
        throw const CachedException("erro");
      }
      return debugData;
  }
}
