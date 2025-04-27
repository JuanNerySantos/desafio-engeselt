import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:marketplace/data/drift/db_connection/app_db.dart';
import 'package:marketplace/services/delete_product.dart';
import 'package:marketplace/services/get_product_by_store.dart';
import 'package:marketplace/ui/components/form_update.dart';

class MyPostPage extends StatefulWidget {
  const MyPostPage({super.key});

  @override
  State<MyPostPage> createState() => _PostPageState();
}

class _PostPageState extends State<MyPostPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductData>?>(
      future: GetProductByStoreService(context: context).getProductByStore(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text('Erro ao carregar produtos'));
        }

        final products = snapshot.data ?? [];

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];

            return Container(
              child: Card(
                color: Color(0xFFC9733A),
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(children: _getImages(product.image.toString())),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            product.nameProduct.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(width: 10),
                          Text(
                            'R\$ ${product.price.toString()}',
                            style: const TextStyle(fontSize: 17),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                      Text(
                        product.description.toString(),
                        style: const TextStyle(fontSize: 15),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              final id = products[index].id;

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FormUpdate(id: id),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),

                              decoration: BoxDecoration(
                                color: Color(0xffc8e6c9),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Text(
                                'Editar',
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              final id = products[index].id;
                              DeleteProductService(id: id).deleteProduct();
                              setState(() {});
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),

                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Text(
                                'Excluir',
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  List<Widget> _getImages(String base64Str) {
    try {
      base64Str = base64Str.replaceAll('[', '').replaceAll(']', '').trim();
      List<String> base64Images = base64Str.split(',');

      return base64Images.map((img) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Image.memory(
            base64Decode(img.trim()),
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
            errorBuilder:
                (context, error, stackTrace) =>
                    const Text('Erro ao carregar imagem'),
          ),
        );
      }).toList();
    } catch (e) {
      return [const Text('Erro ao carregar imagens')];
    }
  }
}
