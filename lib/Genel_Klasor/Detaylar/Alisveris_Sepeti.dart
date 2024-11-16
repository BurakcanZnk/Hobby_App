import 'package:Hobby_App/Genel_Klasor/Detaylar/Satin_Al.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Alisveris_Sepeti(),
    );
  }
}

class Alisveris_Sepeti extends StatefulWidget {
  @override
  _Alisveris_SepetiState createState() => _Alisveris_SepetiState();
}

class _Alisveris_SepetiState extends State<Alisveris_Sepeti> {
  List<String> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alışveriş Sepetiniz'),
        backgroundColor: Colors.grey[400],
        elevation: 0,
      ),
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey[400],
                  child: ListTile(
                    title: Text(cartItems[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_shopping_cart),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content:
                            Text("Sepetinizden çıkarılmıştır."))
                        );
                        setState(() {
                          cartItems.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.grey[400],
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Satin_Al()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[400],
                ),
                child: Text('Satın Al',
                  style: TextStyle(color: Colors.black),),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? result = await showDialog(
            context: context,
            builder: (context) => AddItemDialog(),
          );
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content:
              Text("Sepetinize Eklenmiştir."))
          );
          if (result != null && result.isNotEmpty) {
            setState(() {
              cartItems.add(result);
            });
          }
        },
        backgroundColor: Colors.grey[400],
        child: SvgPicture.asset(
          "assets/Iconlar/add_to_cart.svg",
          colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
        ),
      ),
    );
  }
}

class AddItemDialog extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Ek Olarak Eklemek İstediğiniz Model'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Model Adı',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Kapat', style: TextStyle(color: Colors.black)),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, _controller.text.trim());
          },
          child: Text('Sepete Ekle', style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}