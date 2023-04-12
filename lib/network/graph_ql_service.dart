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

  Future<QueryResult> performQuery(String query,
      {Map<String, dynamic>? variables = const {}}) async {
    final QueryOptions options = QueryOptions(document: gql(query));
    final QueryResult result = await _graphQLClient.query(options);
    print(query);
    print("###############################");
    print(result.toString());
    print("##############DATA#################");
    print("data is ${result.data}");
    print("##############");
    print('Exception is ${result.exception}');
    return result;
  }

  Future<QueryResult> performMutation(String mutation,
      {Map<String, dynamic>? variables = const {}}) async {
    final MutationOptions options =
        MutationOptions(document: gql(mutation), variables: variables ?? {});
    final QueryResult result = await _graphQLClient.mutate(options);
    print(mutation);
    print("###############################");
    print(result.toString());
    print("##############DATA#################");
    print("data is ${result.data}");
    print("##############");
    print('Exception is ${result.exception}');
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

  Future<QueryResult> executeQuery(
      GraphQLClient client, QueryOptions options) async {
    try {
      return await client.query(options);
    } on OperationException catch (e) {
      if (e.graphqlErrors.isNotEmpty) {
        final error = e.graphqlErrors.first;
        if (error.extensions != null &&
            error.extensions?['code'] == 'THROTTLED') {
          // Rate limit has been reached, retry after a delay.
          final retryAfter = error.extensions?['retryAfter'];
          if (retryAfter is int) {
            print('Rate limit reached, retrying after $retryAfter seconds...');
            await Future.delayed(Duration(seconds: retryAfter));
            return executeQuery(client, options);
          }
        }
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
