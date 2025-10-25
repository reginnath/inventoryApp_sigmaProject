import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase - akan otomatis mengambil konfigurasi dari google-services.json/GoogleService-Info.plist
  await Firebase.initializeApp();

  runApp(const InventoryApp());
}
