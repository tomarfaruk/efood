import 'package:efood/config/my_logger.dart';
import 'package:efood/config/urls.dart';
import 'package:efood/model/banner_model.dart';
import 'package:efood/widget.dart/toast.dart';
import 'package:get/get.dart';

class BannerController extends GetConnect {
  RxList<BannerModel> menuList = RxList<BannerModel>();

  var loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = Urls.base_url;

    // getData();
  }

  Future<void> getData() async {
    loading(true);
    Response response = await httpClient.get(Urls.banner_url);
    localLogWriter(response.bodyString);

    if (response.isOk) {
      var catList = bannerModelFromJson(response.bodyString);
      menuList(catList);

      localLogWriter(catList.length.toString());
    } else if (response.status.connectionError) {
      errorToast('Check you internet connection');
    }

    loading(false);
  }
}
