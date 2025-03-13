import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  final storage = FlutterSecureStorage();

  HomeScreen({super.key});

  Future<void> _logout(BuildContext context) async {
    await storage.deleteAll();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"), actions: [
        IconButton(
          icon: Icon(Icons.logout),
          onPressed: () => _logout(context),
        )
      ]),
      body: Center(child: Text("Welcome!")),
    );
  }
}
