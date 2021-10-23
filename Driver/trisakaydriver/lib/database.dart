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

  Future<void> getUserData() async {
    try {
      await _firestore
          .collection('driver')
          .doc(_auth.currentUser!.uid)
          .get()
          .then((value) =>
              {_controller.user = UserModel.getDocumentSnapshot(value)});
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
    List<WaitingList> retVal = [];
    return _firestore
        .collection("pickup")
        .snapshots()
        .map((QuerySnapshot query) {
      try {
        query.docs.forEach((queryDocumentSnapshot) {
          retVal
              .add(WaitingList.getQueryDocumentSnapshot(queryDocumentSnapshot));
        });
      } catch (e) {
        print(e.toString());
      }
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
