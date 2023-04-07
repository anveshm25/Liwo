import 'package:liwo_mobile/screens/login/model/create_customer_access_token_response_model.dart';

import '../../../network/api_response.dart';
import '../../../network/graph_ql_service.dart';

class LoginRepository {
  final GraphQLService _service = GraphQLService();

  Future<ApiResponse<CreateCursomerAccessTokenResponseModel>> createAccessToken(
      {required Map<String, dynamic> variables}) async {
    String mutation = r'''
mutation customerAccessTokenCreate($input: CustomerAccessTokenCreateInput!) {
  customerAccessTokenCreate(input: $input) {
    customerAccessToken {
      accessToken
      expiresAt
    }
    customerUserErrors {
      message
      field
      code
    }
  }
}
''';
    var response =
        await _service.performMutation(mutation, variables: variables);
    CreateCursomerAccessTokenResponseModel model =
        CreateCursomerAccessTokenResponseModel.fromJson(response.data ?? {});
    return ApiResponse<CreateCursomerAccessTokenResponseModel>(
        status: false, success: !response.hasException, data: model);
  }
}
