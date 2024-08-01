part of local;

abstract class ILocalStorage {
  Future get({required String key, Map<String, Object?>? debugData});
  Future<bool> clear({bool? debugData});
  Future<bool> delete({required String key, bool? debugData});
  Future<bool> put(
      {required String key, required dynamic value, bool? debugData});
}
