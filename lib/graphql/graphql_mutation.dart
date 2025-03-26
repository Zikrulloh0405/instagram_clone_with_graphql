// const String loginMutation = """
//   mutation Login(\$input: Credentials!) {
//     login(input: \$input) {
//       ... on User {
//         id
//         userEmail
//         followers
//         following
//         profileImage
//       }
//       ... on LoginError {
//         message
//       }
//     }
//   }
// """;


import 'package:graphql_flutter/graphql_flutter.dart';

const String createNewsMutation = """
  mutation CreateNews(\$input: NewsInput!) {
    kunUzAdmin(input: \$input)
  }
""";

void createNews(GraphQLClient client) async {
  final MutationOptions options = MutationOptions(
    document: gql(createNewsMutation),
    variables: {
      "input": {"title": "Breaking News", "desc": "Some description"}
    },
  );

  final QueryResult result = await client.mutate(options);

  if (result.hasException) {
    print(result.exception.toString());
  } else {
    print("News Created: ${result.data?["kunUzAdmin"]}");
  }
}
