// import 'package:client/screens/home_screen.dart';
// import 'package:client/screens/login_screen.dart';
// import 'package:client/settings/secure_storage.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         ),
//         home: token != null ? HomeScreen() : LoginScreen());
//   }
// }


import 'package:client/graphql/graphql_config.dart';
import 'package:client/screens/home_screen.dart';
import 'package:client/screens/subscription_screen.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQLConfig.initClient(),
      child: CacheProvider(child: MaterialApp(home: NewsSubscription())),
    );
  }
}
