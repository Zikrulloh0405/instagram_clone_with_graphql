import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

const String newsSubscription = """
  subscription ListenNews {
    kunUz {
      title
      desc
    }
  }
""";

class NewsSubscription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Subscription(
      options: SubscriptionOptions(document: gql(newsSubscription)),
      builder: (result) {
        if (result.hasException) {
          return Text("Error: ${result.exception.toString()}");
        }
        if (result.isLoading) {
          return Text("Waiting for news...");
        }

        final news = result.data?["kunUz"];
        return Column(
          children: [
            Text("Title: ${news["title"]}"),
            Text("Desc: ${news["desc"]}"),
          ],
        );
      },
    );
  }
}
