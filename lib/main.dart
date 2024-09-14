import 'package:flutter/material.dart';
import 'package:vinyl_list/utils/db_connection.dart';
import 'package:vinyl_list/view/page/dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final DbConnection _dbConnection = DbConnection();

  // Connection to the db when opening app
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _connectToDatabase();
  }

  // Disconnection from the db when closing app
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _disconnectFromDatabase();
    super.dispose();
  }

  Future<void> _connectToDatabase() async {
    try {
      await _dbConnection.connect();
    } catch (e) {
      // TODO Show alert with error
    }
  }

  Future<void> _disconnectFromDatabase() async {
    await _dbConnection.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'VinylList',
      home: DashboardPage(),
    );
  }
}