import 'package:efood/controller/menu_controller.dart';
import 'package:efood/model/menu_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuerComponent extends StatelessWidget {
  final MenuController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: 260,
      child:
          Obx(() => _controller.loading.value ? _loader() : _buildListWidget()),
    );
  }

  Widget _loader() => Center(
          child: Column(
        children: [
          _headerWidget(),
          SizedBox(height: 15),
          CircularProgressIndicator()
        ],
      ));
  Widget _buildListWidget() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _headerWidget(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 8),
              scrollDirection: Axis.horizontal,
              children: [
                ..._controller.menuList.map((model) => _getCard(model)),
              ],
            ),
          ),
        ],
      );

  Widget _headerWidget() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Set Menu'), Text('View All')],
        ));
  }

  Widget _getCard(MenuModel model) {
    return Container(
      width: Get.width * .46,
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_coverImage(), _footerContent(model)],
        ),
      ),
    );
  }

  Padding _footerContent(MenuModel model) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(model?.description ?? 'No description', maxLines: 2),
            SizedBox(height: 10),
            _rating(),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${model.price ?? "0"}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(Icons.add, color: Colors.black),
              ],
            ),
          ],
        ),
      );
  Widget _rating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(Icons.star, size: 14, color: Colors.red[600]),
        Icon(Icons.star, size: 14, color: Colors.red[600]),
        Icon(Icons.star, size: 14, color: Colors.red[600]),
        Icon(Icons.star, size: 14, color: Colors.red[600]),
        Icon(Icons.star, size: 14, color: Colors.red[600]),
      ],
    );
  }

  Widget _coverImage() => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5))),
        height: 100,
        child: Image.asset('assets/placeholder.jpg', fit: BoxFit.cover),
      );
}
