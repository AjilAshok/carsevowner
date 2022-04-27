import 'package:carsevowner/Authentication/googlesign.dart';
import 'package:carsevowner/bottomnav/bottomnav.dart';
import 'package:carsevowner/splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:native_notify/native_notify.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NativeNotify.initialize(472, 'qMMR6PMv5Lfht6dCRrmQzA', null);
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(DateTime.now().millisecondsSinceEpoch);
    
    final user = FirebaseAuth.instance.currentUser;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        unselectedWidgetColor: Color(0xFF008000),
        primarySwatch: Colors.blue,
      ),
      home:Splashscreen() 
    );
  }
}
