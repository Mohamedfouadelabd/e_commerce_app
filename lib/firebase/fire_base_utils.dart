import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/firebase/my_item.dart';

class FireBaseUtils {
  static CollectionReference<MyItem> getAllCollection() {
    return FirebaseFirestore.instance
        .collection(MyItem.collection)
        .withConverter<MyItem>(
          fromFirestore: (snapshot, options) =>
              MyItem.fromFireStore(snapshot.data() ?? {}),
          toFirestore: (myItem, options) => myItem.toFireStore(),
        );
  }

  static Future<void> addItem(MyItem myItem) {
    var itemCollection = getAllCollection();
    var docRef = itemCollection.doc(myItem.id);
    return docRef.set(myItem);
  }
}
