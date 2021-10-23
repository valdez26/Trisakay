import 'package:trisakaydriver/packages.dart';

class Allbindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<MapController>(() => MapController());
  }
}
