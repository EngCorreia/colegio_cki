library local;

import 'dart:convert';

import 'package:errors/errors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_migration_service/sqflite_migration_service.dart';


part 'db/database_initialization.dart';
part 'db/local_database_implementation.dart';
part 'storage/local_storage_implementation.dart';
part 'storage/local_storage_fk_implementation.dart';
part 'db/local_database_setup_interface.dart';
part 'storage/local_storage_interface.dart';
part 'db/local_database_interface.dart';
part 'db/local_database_setup.dart';
part 'db/local_database_fk_implementation.dart';