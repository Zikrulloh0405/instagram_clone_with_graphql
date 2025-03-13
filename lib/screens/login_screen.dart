import 'package:client/settings/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../graphql/graphql_config.dart';
import '../graphql/graphql_mutation.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login(GraphQLClient client) async {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    final QueryResult result = await client.mutate(
      MutationOptions(
        document: gql(loginMutation),
        variables: {
          "input": {"userEmail": email, "password": password}
        },
      ),
    );

    if (result.hasException) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${result.exception.toString()}")),
      );
      return;
    }

    final data = result.data?['login'];

    if (data == null || data['message'] != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Failed: ${data['message']}")),
      );
      return;
    }

    await SecureStorageHelper().write(StorageKeys().userKey, data.toString());
    
    

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GraphQLClient>(
      future: initGraphQLClient(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final client = snapshot.data!;

        return GraphQLProvider(
          client: ValueNotifier(client),
          child: Scaffold(
            body: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 300),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Text("Login"),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true),
                    SizedBox(height: 20),
                    MaterialButton(
                      minWidth: 200,
                      color: Colors.blue,
                      onPressed: () => _login(client),
                      child: Text("Login"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
