part of local;

class LocalDatabaseImplementation implements ILocalDatabase {
  LocalDatabaseImplementation(this.db);
  final ILocalDatabaseSetup db;

  @override
  Future<int> delete(
      {required String table,
      String? where,
      List<Object?>? whereArgs,
      int? debugData}) async {
    try {
      final result =
          await db.database.delete(table, where: where, whereArgs: whereArgs);

      return result;
    } catch (e) {
      throw CachedException("$e");
    }
  }

  @override
  Future<List<Map<String, Object?>>> get(
      {required String table,
      String? where,
      List<Object?>? whereArgs,
      List<Map<String, Object?>>? debugData}) async {
    try {
      final result =
          await db.database.query(table, where: where, whereArgs: whereArgs);

      return result;
    } catch (e) {
      throw CachedException("$e");
    }
  }

  @override
  Future postBulk(
      {required String table,
      required List<Map<String, Object?>> values,
      String? debugType}) async {
    try {
      Batch batch = db.database.batch();
      for (var v in values) {
        batch.insert(table, v);
      }
      var data = await batch.commit(noResult: false);
      return data;
    } catch (e) {
      throw CachedException("$e");
    }
  }

  @override
  Future putBulk(
      {required String table,
      required List<Map<String, Object?>> values,
      String? where,
      List<Object?>? whereArgs,
      String? debugType}) async {
    try {
      Batch batch = db.database.batch();
      for (var v in values) {
        batch.update(table, v,
            where: "rotaHeaderId= ? AND rotaRunId= ?",
            whereArgs: [v["rotaHeaderId"], v["rotaRunId"]]);
      }

      var data = await batch.commit(noResult: false);
      return data;
    } catch (e) {
      throw CachedException("$e");
    }
  }

  @override
  Future<int> post(
      {required String table,
      required Map<String, Object?> values,
      int? debugData}) async {
    try {
      final result = await db.database.insert(table, values);
      return result;
    } catch (e) {
      throw CachedException("$e");
    }
  }

  @override
  Future<int> put(
      {required String table,
      required Map<String, Object?> values,
      String? where,
      List<Object?>? whereArgs,
      int? debugData}) async {
    try {
      final result = await db.database
          .update(table, values, where: where, whereArgs: whereArgs);
      return result;
    } catch (e) {
      throw CachedException("$e");
    }
  }

  @override
  Future<Map<String, Object?>> index(
      {required String table,
      String? where,
      List<Object?>? whereArgs,
      Map<String, Object?>? debugData}) async {
    try {
      final result =
          await db.database.query(table, where: where, whereArgs: whereArgs);
      return result.first;
    } catch (e) {
      throw CachedException("$e");
    }
  }
}
