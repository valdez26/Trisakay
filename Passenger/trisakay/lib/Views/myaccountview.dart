import 'package:trisakay/packages.dart';

class MyAccountView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Customtext.text(
            title: "My Account",
            size: 18,
            color: Colors.white,
            fontWeight: FontWeight.w800),
      ),
      body: Center(
        child: Customtext.text(title: "My Account here"),
      ),
    );
  }
}
