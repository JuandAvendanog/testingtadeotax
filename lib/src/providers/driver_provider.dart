import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tadeotax_android/src/models/driver.dart';

class DriverProvider {
  late CollectionReference _ref;

  DriverProvider() {
    _ref = FirebaseFirestore.instance.collection('Drivers');
  }

  Future<void> create(Driver driver) async {
    String errorMessage = '';

    try {
      await _ref.doc(driver.id).set(driver.toJson());
    } catch (error) {
      errorMessage = error.toString();
    }

    if (errorMessage.isNotEmpty) {
      throw Future.error(errorMessage);
    }
  }

  Future<Driver> getById(String id) async {
    DocumentSnapshot document = await _ref.doc(id).get();
    if (document.exists) {
      Driver driver = Driver.fromJson(document.data() as Map<String, dynamic>);
      return driver;
    }
    throw Exception('Driver not found');
  }
}
