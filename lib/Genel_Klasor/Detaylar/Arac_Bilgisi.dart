import 'package:flutter/material.dart';
import 'package:Hobby_App/Genel_Klasor/Detaylar/Urun.dart';

class EditProductDetails extends StatefulWidget {
  final Product product;
  final Function(Product) onSave;

  const EditProductDetails({
    Key? key,
    required this.product,
    required this.onSave,
  }) : super(key: key);

  @override
  _EditProductDetailsState createState() => _EditProductDetailsState();
}

class _EditProductDetailsState extends State<EditProductDetails> {
  late TextEditingController _titleController;
  late TextEditingController _imageController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.product.title);
    _imageController = TextEditingController(text: widget.product.image);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ürün Detaylarını Düzenle'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final updatedProduct = widget.product.copyWith(
                title: _titleController.text,
                image: _imageController.text,
              );
              widget.onSave(updatedProduct);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Ürün Adı'),
            ),
            TextField(
              controller: _imageController,
              decoration: InputDecoration(labelText: 'Ürün Görseli'),
            ),
          ],
        ),
      ),
    );
  }
}
