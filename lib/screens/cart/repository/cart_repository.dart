import '../../../network/api_response.dart';
import '../../../network/graph_ql_service.dart';
import '../../products/models/product_query_response_model.dart';
import '../../products/respository/product_respository.dart';

class CartRepository {
  final GraphQLService _service = GraphQLService();
  final ProductRepository _productRepository = ProductRepository();

  Future<void> addProductInCart(String productId) async {
    ApiResponse<ProductQueryResponseModel> productResponse =
        await _productRepository.fetchVariantIdOfProduct(productId);
    if (productResponse.status != Status.error) {}
  }

  cartCreate() {
    String query = r'''
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
  }
}
