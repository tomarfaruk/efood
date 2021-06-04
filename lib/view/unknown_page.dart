import 'package:flutter/material.dart';

class UnknownRoutePage extends StatefulWidget {
  const UnknownRoutePage({Key key}) : super(key: key);

  @override
  _UnknownRoutePageState createState() => _UnknownRoutePageState();
}

class _UnknownRoutePageState extends State<UnknownRoutePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Unknown page, please define this route'),
        ),
      ),
    );
  }
}
