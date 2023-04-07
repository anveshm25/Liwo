import 'package:liwo_mobile/network/api_response.dart';
import 'package:liwo_mobile/network/graph_ql_service.dart';

import '../model/register_user_response_model.dart';

class RegisterRepository {
  final GraphQLService _service = GraphQLService();

  Future<ApiResponse<RegisterUserResponse>> registerUser(
      {required Map<String, dynamic> variables}) async {
    String mutation = r'''
mutation CustomerCreate($input: CustomerCreateInput!) {
    customerCreate(input: $input) {
      customer {
        id
      }
      customerUserErrors {
        code
        field
        message
      }
    }
  }
''';
    var response =
        await _service.performMutation(mutation, variables: variables);
    RegisterUserResponse userResponse =
        RegisterUserResponse.fromJson(response.data ?? {});
    print('\n');
    print('${response.data}');
    print('\n');
    return ApiResponse<RegisterUserResponse>(
        isLoading: false, success: !response.hasException, data: userResponse);
  }
}
