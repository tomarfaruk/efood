import 'package:efood/view/badabase_test/view_db_page.dart';
import 'package:efood/view/home/home_page.dart';
import 'package:efood/view/no_internet.dart';
import 'package:efood/view/unknown_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const home_page = '/';
  static const view_db_page = 'view_db_page';

  static const notfound_page = '/notfound';
  static const no_internet_page = '/notfound';

  static final routes = [
    GetPage(name: home_page, page: () => HomePage()),
    GetPage(name: no_internet_page, page: () => NoInternet()),
    GetPage(name: notfound_page, page: () => UnknownRoutePage()),
    GetPage(name: view_db_page, page: () => ViewBdPage()),
  ];
}
