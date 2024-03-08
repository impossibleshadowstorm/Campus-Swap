import 'package:campus_swap/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:campus_swap/services/storage_services.dart';


class Global {
  static late StorageServices storageServices;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    );
    storageServices = await StorageServices().init();
  }
}
