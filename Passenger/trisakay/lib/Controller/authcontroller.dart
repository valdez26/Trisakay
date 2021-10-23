import 'package:trisakay/packages.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  //Get Instance of Authentication
  final FirebaseAuth _user = FirebaseAuth.instance;
  UserModel? user;

  //Controllers for Login & Singup
  final TextEditingController name = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();

  RxBool loginPageStatus = true.obs;
  RxBool passwordPrefixStatus = true.obs;
  RxBool confirmpassPrefixStatus = true.obs;

  User? get users => _user.currentUser;

  void loginUser() {
    try {
      Firedatabase().login();
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  void signin() {
    try {
      Firedatabase().signup();
    } catch (e) {
      print(e.toString());
    }
  }

  void signout() {
    try {
      Firedatabase().signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  void changeLoginPageStatus() {
    if (loginPageStatus.isTrue) {
      loginPageStatus.value = false;
    } else {
      loginPageStatus.value = true;
    }
    refresh();
  }

  void prefixPassword() {
    if (passwordPrefixStatus.isTrue) {
      passwordPrefixStatus.value = false;
    } else {
      passwordPrefixStatus.value = true;
    }
    refresh();
  }

  void prefixConfirmPassword() {
    confirmpassPrefixStatus.value != confirmpassPrefixStatus.value;
    refresh();
  }

  void clear() {
    name.clear();
    email.clear();
    password.clear();
    confirmpassword.clear();
  }
}
