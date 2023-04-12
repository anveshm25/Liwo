import 'package:liwo_mobile/network/api_response.dart';
import 'package:liwo_mobile/network/graph_ql_service.dart';
import 'package:liwo_mobile/screens/products/models/product_query_response_model.dart';

import '../models/product_list_data.dart';

class ProductRepository {
  final GraphQLService _service = GraphQLService();

  Future<ApiResponse<ProductData>> fetchProducts() async {
    String query = '''
      query {
    products(first: 20) {
    edges {
      node {
        id  
        title
        description
        media(first:1){
            edges{
                node{
                    alt
                    mediaContentType
                }
            }
        }
        images(first: 1) {
        edges {
          node {
            originalSrc
          }
        }
      }
        priceRange {
          minVariantPrice {
            amount
            currencyCode  #active local currency
          }
          maxVariantPrice {
            amount
            currencyCode
          }
        }
        compareAtPriceRange {
          minVariantPrice {
            amount
            currencyCode  #active local currency
          }
          maxVariantPrice {
            amount
            currencyCode
          }
        }
      }
    }
  }
  }
''';
    var result = await _service.performQuery(query);

    ProductData productData = ProductData.fromJson(result.data ?? {});
    ApiResponse<ProductData> response = ApiResponse(
        status: result.hasException ? Status.error : Status.success,
        success: !result.hasException,
        message: "",
        data: productData);
    return response;
  }

  Future<ApiResponse<ProductQueryResponseModel>> fetchVariantIdOfProduct(
      String productId) async {
    String query = r'''
query($productId: ID!) {
      product(id: $productId) {
        variants(first: 1) {
          edges {
            node {
              id
            }
          }
        }
      }
    }
''';

    var result =
        await _service.performQuery(query, variables: {'productId': productId});

    ProductQueryResponseModel productResponse =
        ProductQueryResponseModel.fromJson(result.data ?? {});

    ApiResponse<ProductQueryResponseModel> response = ApiResponse(
        status: result.hasException ? Status.error : Status.success,
        success: !result.hasException,
        message: "",
        data: productResponse);
    return response;
  }
}
