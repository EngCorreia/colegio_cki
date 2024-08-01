part of local;

abstract class ILocalDatabase {
  Future<Map<String, Object?>> index(
      {required String table,
      String? where,
      List<Object?>? whereArgs,
      Map<String, Object?>? debugData});
  Future<List<Map<String, Object?>>> get(
      {required String table,
      String? where,
      List<Object?>? whereArgs,
      List<Map<String, Object?>>? debugData});
  Future postBulk(
      {required String table,
      required List<Map<String, Object?>> values,
      String? debugType});
  Future putBulk(
      {required String table,
      required List<Map<String, Object?>> values,
      String? where,
      List<Object?>? whereArgs,
      String? debugType});
  Future<int> post(
      {required String table,
      required Map<String, Object?> values,
      int? debugData});
  Future<int> put(
      {required String table,
      required Map<String, Object?> values,
      String? where,
      List<Object?>? whereArgs,
      int? debugData});
  Future<int> delete(
      {required String table,
      String? where,
      List<Object?>? whereArgs,
      int? debugData});
}
