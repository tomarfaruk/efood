import 'package:cached_network_image/cached_network_image.dart';
import 'package:efood/config/urls.dart';
import 'package:efood/controller/category_controller.dart';
import 'package:efood/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryComponent extends StatelessWidget {
  final CategoryController _controller = Get.find();
  Widget _getImage(String url) {
    return Image.network(
      url,
      errorBuilder:
          (BuildContext context, Object exception, StackTrace stackTrace) {
        // Appropriate logging or analytics, e.g.
        // myAnalytics.recordError(
        //   'An error occurred loading "https://example.does.not.exist/image.jpg"',
        //   exception,
        //   stackTrace,
        // );
        return Image.asset('assets/placeholder.jpg');
      },
      fit: BoxFit.fill,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes
                : null,
          ),
        );
      },
    );
  }

  var boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 2.0,
          spreadRadius: 0.0,
          offset: Offset(2.0, 2.0), // shadow direction: bottom right
        )
      ]);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration,
      height: 160,
      child:
          Obx(() => _controller.loading.value ? _loader() : _getloadeditem()),
    );
  }

  Column _getloadeditem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _header(),
        SizedBox(height: 5),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 8),
            scrollDirection: Axis.horizontal,
            children: [
              ..._controller.categoryList.map((model) => _getItemCard(model))
            ],
          ),
        ),
      ],
    );
  }

  Center _loader() {
    return Center(
        child: Column(
      children: [
        _header(),
        SizedBox(height: 5),
        CircularProgressIndicator(),
      ],
    ));
  }

  Container _getItemCard(CategoryModel model) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          // Flexible(child:  _getImage(Urls.category_image_url + model.image)),
          CircleAvatar(
              backgroundImage: AssetImage('assets/placeholder.jpg'),
              maxRadius: 35),
          SizedBox(height: 8),
          Text(model.name),
        ],
      ),
    );
  }

  Padding _header() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Row(children: [Text('All Category')]));
  }
}
