import 'package:firebase_database/firebase_database.dart';

class FirebaseRealtimeDB {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

  // Write data to Firebase Realtime Database
  Future<void> writeToDB(String path, Map<String, dynamic> data) async {
    try {
      await _databaseReference.child(path).set(data);
      print('Data written to Firebase Realtime Database successfully');
    } catch (e) {
      print('Error writing data to Firebase Realtime Database: $e');
    }
  }

  // Read data from Firebase Realtime Database
  Future<Map<String, dynamic>> readFromDB(String path) async {
    try {
      DatabaseEvent event = await _databaseReference.child(path).once();
      Map<dynamic, dynamic> data = event.snapshot.value as Map;
      var ss = data.cast<String, dynamic>();

      return ss;
    } catch (e) {
      print('Error reading data from Firebase Realtime Database: $e');
      return {};
    }
  }
}
