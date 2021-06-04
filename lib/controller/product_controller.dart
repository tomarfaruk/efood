import 'package:efood/config/my_logger.dart';
import 'package:efood/config/urls.dart';
import 'package:efood/model/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetConnect {
  var productList = ProductModel().obs;

  var loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = Urls.base_url;

    // getData();
  }

  Future<void> getData() async {
    loading(true);
    String url = Urls.all_product_url.replaceAll(':limit', '10');

    Response response = await httpClient.get(url);
    print(response.statusCode);
    // localLogWriter(response.bodyString.runtimeType.toString());
    // https://dev.6amtech.com/efood/api/v1/products/latest?limit=10&&offset=1

    if (response.isOk) {
      var catList = productModelFromJson(response.bodyString);
      productList(catList);

      print(catList.products.length.toString());
      // localLogWriter(catList.products.length.toString());
    }
    // else if (response.status.connectionError) {
    //   errorToast('Check you internet connection');
    // }

    loading(false);
  }
}
