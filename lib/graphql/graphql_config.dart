import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

const String apiUrl = "http://localhost:4000/graphql"; // Update if needed

final HttpLink httpLink = HttpLink(apiUrl);
const storage = FlutterSecureStorage();

Future<GraphQLClient> initGraphQLClient() async {
  final String? token = await storage.read(key: "token");

  final AuthLink authLink = AuthLink(
    getToken: () async => token != null ? 'Bearer $token' : null,
  );

  final Link link = authLink.concat(httpLink);

  return GraphQLClient(
    cache: GraphQLCache(),
    link: link,
  );
}
