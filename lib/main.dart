import 'package:Hobby_App/Ana_Menu/Gecis_Ekrani.dart';
import 'package:flutter/material.dart';
import 'package:Hobby_App/Genel_Klasor/Detaylar/Metin.dart';
import 'package:Hobby_App/Ana_Menu/Ana_Ekran.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Firebase_Ayarlar/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(home:Gecis_Ekrani()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hobby_App',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Ana_Menu(),
    );
  }
}
