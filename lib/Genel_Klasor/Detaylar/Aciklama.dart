import 'package:flutter/material.dart';
import 'package:Hobby_App/Genel_Klasor/Detaylar/Urun.dart';
import 'package:Hobby_App/Genel_Klasor/Detaylar/Metin.dart';

class Aciklama extends StatelessWidget {
  const Aciklama({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        product.description,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
