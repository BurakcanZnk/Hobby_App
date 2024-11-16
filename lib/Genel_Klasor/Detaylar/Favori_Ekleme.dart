import 'package:flutter/material.dart';
import 'package:Hobby_App/Genel_Klasor/Detaylar/Urun.dart';

class Favori_Ekleme extends StatefulWidget {
  final Product product;

  Favori_Ekleme({required this.product});

  @override
  _Favori_EklemeState createState() => _Favori_EklemeState();
}

class _Favori_EklemeState extends State<Favori_Ekleme> {
  bool favoriDurumu = false;

  void favoriyeEkle() {
    setState(() {
      favoriDurumu = true;
    });
    _showFavoriUyari();
  }

  void _showFavoriUyari() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Favorilere Eklendi'),
          content: Text('Ürün favorilere başarıyla eklendi!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Kapat'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: favoriyeEkle,
      child: Container(
        padding: EdgeInsets.all(8),
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          color: favoriDurumu ? Colors.red : Colors.black,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.favorite,
          color: Colors.white,
        ),
      ),
    );
  }
}
