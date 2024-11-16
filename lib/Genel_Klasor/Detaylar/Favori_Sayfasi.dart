import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Hobby_App/Genel_Klasor/Detaylar/Urun.dart';

class Favori_Sayfasi extends StatefulWidget {
  @override
  _Favori_SayfasiState createState() => _Favori_SayfasiState();
}

class _Favori_SayfasiState extends State<Favori_Sayfasi> {
  List<Product> favoriteProducts = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteIds = prefs.getStringList('favorite_products');

    if (favoriteIds != null) {
      setState(() {
        favoriteProducts = products
            .where((product) => favoriteIds.contains(product.id.toString()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favori Ürünler"),
      ),
      body: ListView.builder(
        itemCount: favoriteProducts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              favoriteProducts[index].image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(favoriteProducts[index].title),
            subtitle: Text(favoriteProducts[index].description),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _removeFromFavorites(favoriteProducts[index]);
              },
            ),
          );
        },
      ),
    );
  }

  void _removeFromFavorites(Product product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteIds = prefs.getStringList('favorite_products');

    if (favoriteIds != null) {
      favoriteIds.remove(product.id.toString());
      await prefs.setStringList('favorite_products', favoriteIds);
      _loadFavorites();
    }
  }
}
