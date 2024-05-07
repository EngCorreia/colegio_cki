part of local;

class LocalDatabaseFkImplementation implements ILocalDatabase {
  @override
  Future<int> delete(
      {required String table,
      String? where,
      List<Object?>? whereArgs,
      int? debugData}) async {
    await Future.delayed(const Duration(milliseconds: 350));
    if (debugData == null) {
        throw const CachedException("erro");
      }
      return debugData;
  }

  @override
  Future<List<Map<String, Object?>>> get(
      {required String table,
      String? where,
      List<Object?>? whereArgs,
      List<Map<String, Object?>>? debugData}) async {
    await Future.delayed(const Duration(milliseconds: 350));
    if (debugData == null) {
        throw const CachedException("erro");
      }
      return debugData;
  }

  @override
  Future<Map<String, Object?>> index(
      {required String table,
      String? where,
      List<Object?>? whereArgs,
      Map<String, Object?>? debugData}) async {
    await Future.delayed(const Duration(milliseconds: 350));
    if (debugData == null) {
        throw const CachedException("erro");
      }
      return debugData;
  }

  @override
  Future<int> post(
      {required String table,
      required Map<String, Object?> values,
      int? debugData}) async {
    await Future.delayed(const Duration(milliseconds: 350));
    if (debugData == null) {
        throw const CachedException("erro");
      }
      return debugData;
  }

  @override
  Future postBulk(
      {required String table,
      required List<Map<String, Object?>> values,
      String? debugType}) async {
    await Future.delayed(const Duration(milliseconds: 350));
    
  }

  @override
  Future<int> put(
      {required String table,
      required Map<String, Object?> values,
      String? where,
      List<Object?>? whereArgs,
      int? debugData}) async {
    await Future.delayed(const Duration(milliseconds: 350));
    if (debugData == null) {
        throw const CachedException("erro");
      }
      return debugData;
  }

  @override
  Future putBulk(
      {required String table,
      required List<Map<String, Object?>> values,
      String? where,
      List<Object?>? whereArgs,
      String? debugType}) async {
    await Future.delayed(const Duration(milliseconds: 350));
  }
}
