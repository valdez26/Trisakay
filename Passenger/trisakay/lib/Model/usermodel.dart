import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? email;
  String? name;
  String? address;

  UserModel();

  UserModel.getDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    email = documentSnapshot.get('email');
    name = documentSnapshot.get('name');
  }

  String? get emailaddrress => email;
  String? get fullname => name;
  String? get useraddress => address;
}
