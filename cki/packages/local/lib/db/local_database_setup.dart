part of local;

class LocalDatabaseSetup implements ILocalDatabaseSetup {
  LocalDatabaseSetup(this.db);
  final DatabaseInitialization db;

  @override
  Database get database => db.database;
}
