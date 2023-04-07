import 'package:liwo_mobile/network/api_response.dart';
import 'package:liwo_mobile/network/graph_ql_service.dart';

import '../models/product_list_data.dart';

class ProductRespository {
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
}
