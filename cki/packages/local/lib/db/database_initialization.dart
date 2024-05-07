part of local;

class DatabaseInitialization {
  DatabaseInitialization(this.migration);

  final  DatabaseMigrationService migration;
   late Database database;


  Future<void> initialize() async {
    database = await openDatabase("waters_database.sqlite", version: 1);
    await migration.runMigration(
      database,
      migrationFiles: ['1_create_schema.sql'],
      verbose: true,
    );
  }

 
 
}
