import 'package:efood/config/my_logger.dart';
import 'package:efood/config/urls.dart';
import 'package:efood/model/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetConnect {
  var productModel = ProductModel();
  var productList = <Product>[].obs;

  var loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = Urls.base_url;

    // getData();
  }

  Future<void> getData() async {
    loading(true);
    String url = '/products/latest?limit=$limit&&offset=$page';

    Response response = await httpClient.get(url);
    

    if (response.isOk) {
      var catList = productModelFromJson(response.bodyString);
      productModel = catList;
      productList(productModel.products);
      totalSize = catList.totalSize;

      print(catList.products.length.toString());
      // localLogWriter(catList.products.length.toString());
    }

    loading(false);
  }

  int page = 1;
  int limit = 10;
  int totalSize = -1;

  Future<void> loadMore() async {
    print('call load more');
    if (totalSize != -1 && page * limit >= productModel.totalSize) return;
    page += 1;
    String url = '/products/latest?limit=$limit&&offset=$page';

    Response response = await httpClient.get(url);
    print(response.statusCode);

    if (response.isOk) {
      var catList = productModelFromJson(response.bodyString);
      productList.addAll((catList.products));

      print(catList.products.length.toString());
      // localLogWriter(catList.products.length.toString());
    }
  }
}
