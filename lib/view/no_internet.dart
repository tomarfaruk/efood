import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Opps\n Check your internet connection'),
        ),
      ),
    );
  }
}
