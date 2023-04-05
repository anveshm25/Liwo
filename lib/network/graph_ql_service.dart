import 'package:graphql/client.dart';

class GraphQLService {
  late GraphQLClient _graphQLClient;

  GraphQLService() {
    final HttpLink httpLink = HttpLink(
      'https://example.com/graphql',
    );

    _graphQLClient = GraphQLClient(
      cache: GraphQLCache(),
      link: httpLink,
    );
  }

  Future<QueryResult> performQuery(String query) async {
    final QueryOptions options = QueryOptions(document: gql(query));
    final QueryResult result = await _graphQLClient.query(options);
    return result;
  }

  Future<QueryResult> performMutation(String mutation) async {
    final MutationOptions options = MutationOptions(document: gql(mutation));
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
