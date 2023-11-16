import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tadeotax_android/src/models/cliente.dart';

class ClientProvider {
  late CollectionReference _ref;

  ClientProvider() {
    _ref = FirebaseFirestore.instance.collection('Clients');
  }

  Future<void> create(Client client) async {
    String errorMessage = '';

    try {
      await _ref.doc(client.id).set(client.toJson());
    } catch (error) {
      errorMessage = error.toString();
    }

    if (errorMessage.isNotEmpty) {
      throw Future.error(errorMessage);
    }
  }

  Future<Client> getById(String id) async {
    DocumentSnapshot document = await _ref.doc(id).get();
    if (document.exists) {
      Client client = Client.fromJson(document.data() as Map<String, dynamic>);
      return client;
    }
    throw Exception('Client not found');
  }
}