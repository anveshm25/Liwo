import '../model/cart_query_response_model.dart';
import '../../../constatns/constants.dart';
import '../../../network/api_response.dart';
import '../../../network/graph_ql_service.dart';
import '../../../utils/shared_preference.dart';
import '../../products/models/product_query_response_model.dart';
import '../../products/respository/product_respository.dart';
import '../model/cart_create_response_model.dart';

class CartRepository {
  final GraphQLService _service = GraphQLService();
  final ProductRepository _productRepository = ProductRepository();

  Future<ApiResponse<CartCreateResponse>?> addProductInCart(
      String productId) async {
    ApiResponse<CartCreateResponse>? cartResponse;
    ApiResponse<ProductQueryResponseModel> productResponse =
        await _productRepository.fetchVariantIdOfProduct(productId);
    if (productResponse.status != Status.error) {
      cartResponse =
          await cartCreate(productResponse.data?.getfirstVariantId() ?? '');
    }
    return cartResponse;
  }

  Future<ApiResponse<CartCreateResponse>> cartCreate(String variantId) async {
    String mutation = r'''
mutation createCart($cartInput: CartInput) {
  cartCreate(input: $cartInput) {
    cart {
      id
      createdAt
      updatedAt
      checkoutUrl
      discountAllocations{
          __typename
          discountedAmount{
              currencyCode
              amount
          }
      }
      discountCodes{
          applicable
          code
      }
      lines(first: 10) {
        edges {
          node {
            id
            merchandise {
              ... on ProductVariant {
                id
              }
            }
          }
        }
      }
      attributes {
        key
        value
      }
      cost {
        totalAmount {
          amount
          currencyCode
        }
        subtotalAmount {
          amount
          currencyCode
        }
        totalTaxAmount {
          amount
          currencyCode
        }
        totalDutyAmount {
          amount
          currencyCode
        }
      }
    }
  }
}
''';

    Map<String, dynamic> variables = {
      "cartInput": {
        "lines": [
          {"quantity": 1, "merchandiseId": variantId}
        ],
        "attributes": {
          "key": "cart_attribute_key",
          "value": "This is a cart attribute value"
        }
      }
    };

    String? accessToken =
        await SharedPreferencesUtils().getStringValuesSF(customerAccessToken);
    if (accessToken != null) {
      variables['cartInput']['buyerIdentity'] = {
        'customerAccessToken': accessToken,
      };
    }

    print('VARIABLE IS ${variables}');

    var result = await _service.performMutation(mutation, variables: variables);
    CartCreateResponse cartResponse =
        CartCreateResponse.fromJson(result.data ?? {});
    ApiResponse<CartCreateResponse> apiResponse = ApiResponse(
      status: result.hasException ? Status.error : Status.success,
      success: !result.hasException,
      message: "",
      data: cartResponse,
    );
    return apiResponse;
  }

  Future<ApiResponse<CartQueryResponseModel>> fetchCart(
      {String? cartId}) async {
    cartId ??= await SharedPreferencesUtils().getStringValuesSF(cartIdPrefKey);
    if (cartId == null) {
      throw 'Cart is Empty';
    }
    String query = r'''
query cartQuery($cartId: ID!) {
  cart(id: $cartId) {
    id
    createdAt
    updatedAt
    checkoutUrl
    lines(first: 10) {
      edges {
        node {
          id
          cost{
              compareAtAmountPerQuantity{amount,currencyCode},
              amountPerQuantity{amount,currencyCode}
          }
          
          quantity
          merchandise {
            ... on ProductVariant {
                product{
                    id,
                    title,
                    productType,
                    images(first:1){
                        nodes{
                            url
                            id  
                        }
                    }
                }
                currentlyNotInStock
                quantityAvailable
                weight
                title
                unitPrice{
                    currencyCode
                    amount
                }
              id
            }
          }
          attributes {
            key
            value
          }
        }
      }
    }
    attributes {
      key
      value
    }
    cost {
      totalAmount {
        amount
        currencyCode
      }
      subtotalAmount {
        amount
        currencyCode
      }
      totalTaxAmount {
        amount
        currencyCode
      }
      totalDutyAmount {
        amount
        currencyCode
      }
    }
    buyerIdentity {  
      email
      phone
      customer {
        id,
        firstName,
        lastName,
        defaultAddress{
            address1,
            address2,
            formattedArea,
            id
            phone
            province
            provinceCode
            firstName
            lastName
            zip
            city
            countryCodeV2
            country
            name
        },
      }
      countryCode
    }
  }
}
''';

    Map<String, dynamic> variables = {"cartId": cartId};
    var result = await _service.performQuery(query, variables: variables);
    var cartData = CartQueryResponseModel.fromJson(result.data ?? {});
    ApiResponse<CartQueryResponseModel> response = ApiResponse(
      status: result.hasException ? Status.error : Status.success,
      success: !result.hasException,
      message: "",
      data: cartData,
    );
    return response;
  }
}
