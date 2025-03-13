import 'package:client/settings/secure_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

const String apiUrl = "http://localhost:4000/graphql";

final HttpLink httpLink = HttpLink(apiUrl);

Future<GraphQLClient> initGraphQLClient() async {
  token = await SecureStorageHelper().read(StorageKeys().tokenKey);

  final AuthLink authLink = AuthLink(
    getToken: () async => token != null ? 'Bearer $token' : null,
  );

  final Link link = authLink.concat(httpLink);

  return GraphQLClient(
    cache: GraphQLCache(),
    link: link,
  );
}
