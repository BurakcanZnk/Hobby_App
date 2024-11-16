import 'dart:io';
import 'package:Hobby_App/Genel_Klasor/Detaylar/Arac_Karti.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Hobby_App/Genel_Klasor/Detaylar/Alisveris_Sepeti.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Hobby_App/Genel_Klasor/Detaylar/Metin.dart';
import 'package:Hobby_App/Genel_Klasor/Detaylar/Urun.dart';
import 'package:Hobby_App/Ana_Menu/Kategoriler.dart';
import 'package:Hobby_App/Giris_Yap/Giris_Yap.dart';
import 'package:Hobby_App/Ayarlar/Ayarlar.dart';

const kDefaultPaddin = 20.0;

class Ana_Menu extends StatefulWidget {
  @override
  _Ana_MenuState createState() => _Ana_MenuState();
}

class _Ana_MenuState extends State<Ana_Menu> {
  File? image;
  final ImagePicker picker = ImagePicker();
  int selectedProductIndex = -1;
  List<Product> favoriUrunler = [];
  List<Product> products = [];

  Future<void> onImageButtonPressed(ImageSource source) async {
    try {
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          image = File(pickedFile.path);
          if (selectedProductIndex >= 0) {
            products[selectedProductIndex] = products[selectedProductIndex].copyWith(image: pickedFile.path);
          }
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void _addFavorite(Product product) {
    setState(() {
      favoriUrunler.add(product);
    });
  }

  void _editProductDetails(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Arac_Bilgisi(
          product: product,
          onSave: (updatedProduct) {
            setState(() {
              products[selectedProductIndex] = updatedProduct;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.settings,
            color: kTextColor,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Ayarlar(),
              ),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.red),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Favori_Sayfasi(favoriUrunler: favoriUrunler),
                ),
              );
            },
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/Iconlar/cart.svg",
              colorFilter: ColorFilter.mode(kTextColor, BlendMode.srcIn),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Alisveris_Sepeti(),
                ),
              );
            },
          ),
          SizedBox(width: kDefaultPaddin / 5),
          IconButton(
            icon: Icon(
              Icons.login,
              color: kTextColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Giris_Yap(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: Row(
              children: [
                Image.asset(
                  "assets/Resimler/Logo.png",
                  height: 60,
                ),
                SizedBox(width: 10, height: 70),
                Text(
                  "BCZ Diecast",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Kategoriler(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width ~/ 180,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.50,
                ),
                itemBuilder: (context, index) => Arac_Karti(
                  product: products[index],
                  press: () {
                    setState(() {
                      selectedProductIndex = index;
                    });
                    _editProductDetails(products[index]);
                  },
                  image: index == selectedProductIndex ? image : null,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [],
      ),
    );
  }

  Arac_Bilgisi({required Product product, required Null Function(dynamic updatedProduct) onSave}) {}
}

class Favori_Sayfasi extends StatelessWidget {
  final List<Product> favoriUrunler;

  Favori_Sayfasi({required this.favoriUrunler});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favori Ürünler'),
      ),
      body: ListView.builder(
        itemCount: favoriUrunler.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: favoriUrunler[index].image.contains("assets")
                ? Image.asset(favoriUrunler[index].image)
                : Image.file(File(favoriUrunler[index].image)),
            title: Text(favoriUrunler[index].title),
          );
        },
      ),
    );
  }
}
