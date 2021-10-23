import 'package:trisakaydriver/packages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Firedatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthController _controller = Get.find<AuthController>();
  final MapController _mapcontroller = Get.find<MapController>();

  Future<void> login() async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: _controller.email.text, password: _controller.password.text);

      _controller.user = UserModel.getDocumentSnapshot(await _firestore
          .collection('driver')
          .doc(_auth.currentUser!.uid)
          .get());

      Get.offAndToNamed('/home');
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> signup() async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: _controller.email.text, password: _controller.password.text);

      await _firestore.collection('driver').doc(_auth.currentUser!.uid).set({
        "email": _auth.currentUser!.email,
        "name": _controller.name.text,
      }).then((documentReference) async {
        _controller.user = UserModel.getData(
            email: _auth.currentUser!.email, name: _controller.name.text);
        Get.offAndToNamed('/home');
      });
    } catch (e) {
      print(e.toString() + "sign in ");
    }
  }

  Future<void> addTransaction() async {
    try {
      await _firestore.collection('waitinglist').add({
        "uid": _auth.currentUser!.uid,
        "pickupLocation": _mapcontroller.waitingList.pickupLocation,
        "destinationLocation": _mapcontroller.waitingList.destinationLocation,
        "status": _mapcontroller.waitingList.status,
      }).then((documentReference) => {});
    } catch (e) {
      // print(e.toString());
    }
  }

  Stream<List<WaitingList>> waitListStream() {
    return _firestore
        .collection("waitinglist")
        .snapshots()
        .map((QuerySnapshot query) {
      List<WaitingList> retVal = [];
      query.docs.map((queryDocumentSnapshot) {
        retVal.add(WaitingList.getQueryDocumentSnapshot(queryDocumentSnapshot));
      });
      return retVal;
    });
  }

  void signOut() {
    try {
      _auth.signOut();
      Get.offAll(Loginview());
    } catch (e) {
      print(e.toString());
    }
  }
}
