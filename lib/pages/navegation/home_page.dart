import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:marketplace/services/list_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: ListProductService().listProductData(''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          print('Erro: ${snapshot.error}');
          return const Center(child: Text('Erro ao carregar produtos'));
        }

        final products = snapshot.data ?? [];

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        backgroundColor: Color.fromARGB(255, 192, 168, 176),
                        title: Text(
                          product['name'].toString(),
                          style: TextStyle(
                            color: Color(0xff6b4226),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: Container(
                          height: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Loja',
                                style: TextStyle(
                                  color: Color(0xff6b4226),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                product['store']['nameStore'].toString(),
                                style: TextStyle(
                                  color: Color(0xff6b4226),
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                'Telefone',
                                style: TextStyle(
                                  color: Color(0xff6b4226),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                product['store']['phone'],
                                style: TextStyle(
                                  color: Color(0xff6b4226),
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                'Endereço',
                                style: TextStyle(
                                  color: Color(0xff6b4226),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${product['store']['street'].toString()},\n ${product['store']['neighborhood'].toString()},${product['store']['city'].toString()},${product['store']['state'].toString()}',
                                style: TextStyle(
                                  color: Color(0xff6b4226),
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Cep',
                                style: TextStyle(
                                  color: Color(0xff6b4226),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                product['store']['cep'],
                                style: TextStyle(
                                  color: Color(0xff6b4226),
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Fechar'),
                          ),
                        ],
                      ),
                );
              },
              child: Card(
                color: Color.fromARGB(135, 237, 123, 47),
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Exibe todas as imagens
                      Column(children: _getImages(product['image'])),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product['name'].toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            'R\$ ${product['price'].toString()}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Text(
                            product['store']['nameStore'].toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            product['store']['phone'].toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      Text(
                        product['description'].toString(),
                        style: const TextStyle(fontSize: 16),
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

  List<Widget> _getImages(dynamic base64List) {
    try {
      if (base64List is List) {
        return base64List.map<Widget>((img) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Image.memory(
              base64Decode(_limparBase64(img)),
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) =>
                      const Text('Erro ao carregar imagem'),
            ),
          );
        }).toList();
      } else {
        return [const Text('Nenhuma imagem encontrada')];
      }
    } catch (e) {
      return [const Text('Erro ao carregar imagens')];
    }
  }

  String _limparBase64(String base64Str) {
    return base64Str.trim();
  }
}
