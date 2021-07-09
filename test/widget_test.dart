// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:efood/controller/banner_controller.dart';
import 'package:efood/controller/category_controller.dart';
import 'package:efood/controller/menu_controller.dart';
import 'package:efood/controller/product_controller.dart';
import 'package:efood/view/home/component/menu_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:efood/main.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

void main() {
  final cateogryCoontroller = Get.put(CategoryController());
  final menuCoontroller = Get.put(MenuController());
  final productCoontroller = Get.put(ProductController());
  final bannerCoontroller = Get.put(BannerController());
  test("category api call", () async {
    await cateogryCoontroller.getData();
  });

  test("menu api call", () async {
    await menuCoontroller.getData();
  });

  test("banner api call", () async {
    await bannerCoontroller.getData();
  });

  test("product api call", () async {
    await productCoontroller.getData();
  });

  var url =
      'https://themes.envytheme.com/ecademy-tutor/wp-json/tutor/v1/courses?order=asc&orderby=ID&paged=1';

  testUrl() async {
    print("test start");

    http.Response response = await http.get(Uri.parse(url));
    print("test end");
    print(response.body);
  }

  test("description", testUrl);
}
