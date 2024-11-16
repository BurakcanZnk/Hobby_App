import 'dart:io';
import 'package:flutter/material.dart';
import 'package:Hobby_App/Genel_Klasor/Detaylar/Urun.dart';

class Arac_Karti extends StatelessWidget {
  final Product product;
  final VoidCallback press;
  final File? image;

  const Arac_Karti({
    Key? key,
    required this.product,
    required this.press,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: product.color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200, // İstediğiniz yüksekliği belirleyin
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: image != null
                    ? Image.file(image!, fit: BoxFit.cover)
                    : Image.asset(product.image, fit: BoxFit.cover),
              ),
            ),
            Text(
              product.title,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "${product.price} ₺",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
