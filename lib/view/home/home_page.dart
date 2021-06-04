import 'package:efood/controller/banner_controller.dart';
import 'package:efood/controller/category_controller.dart';
import 'package:efood/controller/menu_controller.dart';
import 'package:efood/controller/product_controller.dart';
import 'package:efood/view/home/component/banner_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'component/category_component.dart';
import 'component/menu_component.dart';
import 'component/product_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    _pullRefresh();
  }

  int _currentIndex = 0;
  final List<Widget> _children = [];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<void> _pullRefresh() async {
    print("call refresh");
    Get.put(CategoryController()).getData();
    Get.put(MenuController()).getData();
    Get.put(BannerController()).getData();
    Get.put(ProductController()).getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNav(),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _pullRefresh,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              notifyWidget(),
              SizedBox(height: 2),
              _appBar(),
              SizedBox(height: 10),
              _searchField(),
              SizedBox(height: 10),
              CategoryComponent(),
              SizedBox(height: 10),
              MenuerComponent(),
              SizedBox(height: 10),
              BannerComponent(),
              SizedBox(height: 10),
              ProductComponent(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Container _searchField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: Color(0xfff4f7fc),
          prefixIcon: Icon(Icons.search),
          suffixIcon: Icon(Icons.add_road),
          prefixIconConstraints: BoxConstraints(minWidth: 30, minHeight: 30),
          hintText: "Search item here",
          filled: true,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        ),
      ),
    );
  }

  Widget _appBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.asset('assets/delivery.png', width: 40),
          SizedBox(width: 10),
          Text(
            "eFood",
            style: TextStyle(color: Colors.red[600]),
          ),
          Spacer(),
          Icon(Icons.notifications, size: 30)
        ],
      ),
    );
  }

  Container notifyWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.red[400],
      child: Row(
        children: [
          Image.asset('assets/close.png', height: 30),
          SizedBox(width: 8),
          Text("Resturent is close now, will open at 9:00 am")
        ],
      ),
    );
  }

  BottomNavigationBar _bottomNav() {
    return BottomNavigationBar(
      selectedItemColor: Colors.red[600],
      unselectedItemColor: Colors.black54,
      unselectedLabelStyle: TextStyle(color: Colors.black54),
      showUnselectedLabels: true,
      onTap: onTabTapped,
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.shopping_cart),
          title: new Text('Cart'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          title: Text('favourite'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.apps_outlined),
          title: Text('Menu'),
        ),
      ],
    );
  }
}
