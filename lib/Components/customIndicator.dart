import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CircularProgressIndicator(
        backgroundColor: Theme.of(context).primaryColor,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
      ),
    ));
  }
}
