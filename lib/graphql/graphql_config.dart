// import 'package:client/settings/secure_storage.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
//
// const String apiUrl = "http://localhost:4000/graphql";
//
// final HttpLink httpLink = HttpLink(apiUrl);
//
// Future<GraphQLClient> initGraphQLClient() async {
//   token = await SecureStorageHelper().read(StorageKeys().tokenKey);
//
//   final AuthLink authLink = AuthLink(
//     getToken: () async => token != null ? 'Bearer $token' : null,
//   );
//
//   final Link link = authLink.concat(httpLink);
//
//
//
//
//   return GraphQLClient(
//     cache: GraphQLCache(),
//     link: link,
//   );
// }

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfig {
  static HttpLink httpLink = HttpLink("http://localhost:4000/graphql");

  static WebSocketLink wsLink = WebSocketLink(
    "ws://localhost:4000/subscriptions",
    config: const SocketClientConfig(
      autoReconnect: true,
      inactivityTimeout: Duration(seconds: 30),
    ),
  );

  static Link link = Link.split(
        (request) => request.isSubscription,
    wsLink,
    httpLink,
  );

  static ValueNotifier<GraphQLClient> initClient() {
    return ValueNotifier(
      GraphQLClient(
        cache: GraphQLCache(),
        link: link,
      ),
    );
  }
}

