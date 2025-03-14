import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:r_tech/Check_in/Checkin_screen.dart';
import 'package:r_tech/Nearby_venue/nearby_venue.dart';
import 'package:r_tech/feed_screen/feed_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NearbyVenue(),
    );
  }
}


