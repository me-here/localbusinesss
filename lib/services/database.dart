import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  final CollectionReference accounts =
      FirebaseFirestore.instance.collection('accounts');

  Future updateUserData(String name, bool business) async {
    return await accounts.doc(uid).set({'name': name, 'business': business});
  }
}
