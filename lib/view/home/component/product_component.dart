import 'package:efood/config/urls.dart';
import 'package:efood/controller/product_controller.dart';
import 'package:efood/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductComponent extends StatelessWidget {
  final ProductController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => _controller.loading.value ? _loader() : _buildListWidget());
  }

  Widget _loader() {
    return Center(
      child: Column(children: [
        _headerWidget(),
        SizedBox(height: 15),
        CircularProgressIndicator()
      ]),
    );
  }

  Widget _buildListWidget() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _headerWidget(),
          if (_controller.productList.value?.products != null)
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 8),
              children: [
                ..._controller.productList.value.products
                    .map((model) => _getCard(model))
              ],
            ),
        ],
      );

  Widget _headerWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Popular Item'), Text('View All')]),
    );
  }

  Widget _getCard(Product model) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset('assets/placeholder.jpg',
                  width: 100, height: 84, fit: BoxFit.cover),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(model.name),
                _rating(),
                Spacer(),
                Text('\$${model.price}'),
              ],
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.favorite_border_outlined),
                Icon(Icons.add),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _rating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(Icons.star, size: 12, color: Colors.red[600]),
        Icon(Icons.star, size: 12, color: Colors.red[600]),
        Icon(Icons.star, size: 12, color: Colors.red[600]),
        Icon(Icons.star, size: 12, color: Colors.red[600]),
        Icon(Icons.star, size: 12, color: Colors.red[600]),
      ],
    );
  }
}
