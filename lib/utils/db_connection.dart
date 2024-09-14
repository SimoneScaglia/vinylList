import 'package:flutter/foundation.dart';
import 'package:mysql1/mysql1.dart';
import 'constants.dart';

class DbConnection {
  MySqlConnection? _connection;

  Future<void> connect() async {
    final settings = ConnectionSettings(
      host: Constants.dbHost,
      port: Constants.dbPort,
      user: Constants.dbUser,
      password: Constants.dbPassword,
      db: Constants.dbName,
    );

    try {
      _connection = await MySqlConnection.connect(settings);
      if (kDebugMode) {
        print('Connected to the db');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error during the connection to the db: $e');
      }
      rethrow;
    }
  }

  Future<void> disconnect() async {
    if (_connection != null) {
      await _connection!.close();
      if (kDebugMode) {
        print('Disconnected from the db');
      }
    }
  }

  MySqlConnection? get connection => _connection;
}