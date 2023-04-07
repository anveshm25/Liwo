import 'package:graphql/client.dart';

import '../constatns/constants.dart';

class GraphQLService {
  late GraphQLClient _graphQLClient;

  GraphQLService() {
    _graphQLClient = GraphQLClient(
      link: HttpLink(apiUrl, defaultHeaders: {
        'X-Shopify-Storefront-Access-Token': storeFrontApiKey,
      }),
      cache: GraphQLCache(),
    );
  }

  Future<QueryResult> performQuery(String query) async {
    final QueryOptions options = QueryOptions(document: gql(query));
    final QueryResult result = await _graphQLClient.query(options);
    return result;
  }

  Future<QueryResult> performMutation(String mutation,
      {Map<String, dynamic>? variables = const {}}) async {
    final MutationOptions options =
        MutationOptions(document: gql(mutation), variables: variables ?? {});
    final QueryResult result = await _graphQLClient.mutate(options);
    return result;
  }

  Future<Stream<QueryResult<Object?>>> performSubscription(
      String subscription) async {
    final SubscriptionOptions options =
        SubscriptionOptions(document: gql(subscription));
    final Stream<QueryResult<Object?>> result =
        _graphQLClient.subscribe(options);
    return result;
  }
}
