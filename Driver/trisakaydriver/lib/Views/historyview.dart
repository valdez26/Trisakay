import 'package:flutter/rendering.dart';
import 'package:trisakaydriver/packages.dart';

class HistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Customtext.text(
            title: "History",
            size: 18,
            fontWeight: FontWeight.w800,
            color: Colors.white),
      ),
      body: Center(
        child: Customtext.text(title: "History Transaction"),
      ),
    );
  }
}
