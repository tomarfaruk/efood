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

void main() {
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(MyApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
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
}
