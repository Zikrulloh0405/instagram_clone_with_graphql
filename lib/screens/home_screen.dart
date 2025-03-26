// import 'dart:convert';
//
// import 'package:client/settings/secure_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import '../models/user_model.dart';
// import 'login_screen.dart';
//
// class HomeScreen extends StatefulWidget {
//
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//
//   @override
//   void initState(){
//     getUser();
//     print("$user");
//     print("$token");
//
//     super.initState();
//   }
//
//   Future<void> getUser() async {
//     final userData = await SecureStorageHelper().read(StorageKeys().userKey);
//     if (userData == null) {
//       user = User.fromJson(jsonDecode(userData!));
//     }
//     // return User.fromJson(jsonDecode(userData));
//   }
//
//   final storage = FlutterSecureStorage();
//
//   Future<void> _logout(BuildContext context) async {
//     await storage.deleteAll();
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           /// left side
//           Expanded(
//             flex: 1,
//             child: Container(
//               color: Colors.amberAccent,
//               child: Column(
//                 children: [
//
//                   /// my profile
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                       color: Colors.grey,
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               Stack(
//                                 alignment: Alignment.bottomRight,
//                                 children: [
//                                   CircleAvatar(),
//                                   IconButton(onPressed: (){}, icon: Icon(Icons.edit, size: 20,))
//                                 ],
//                               ),
//                               Text("useremail@gmail.com")
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                       color: Colors.red,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Divider(
//             color: Colors.white,
//           ),
//
//           /// right side
//           Expanded(
//             flex: 2,
//             child: Container(
//               color: Colors.black,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
