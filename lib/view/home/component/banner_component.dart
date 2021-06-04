import 'package:efood/config/urls.dart';
import 'package:efood/controller/banner_controller.dart';
import 'package:efood/controller/menu_controller.dart';
import 'package:efood/model/banner_model.dart';
import 'package:efood/model/menu_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerComponent extends StatelessWidget {
  final BannerController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child:
          Obx(() => _controller.loading.value ? _loader() : _buildListWidget()),
    );
  }

  Widget _loader() => Center(
          child: Column(
        children: [
          _headerWidget(),
          SizedBox(height: 5),
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
          children: [Text('Banner')],
        ));
  }

  Widget _getCard(BannerModel model) {
    return Container(
      width: Get.width * 0.8,
      height: 90,
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(Urls.banner_image_url + model.image,
            fit: BoxFit.fill),
        // child: Image.asset('assets/placeholder.jpg', fit: BoxFit.fill),
      ),
    );
  }
}
