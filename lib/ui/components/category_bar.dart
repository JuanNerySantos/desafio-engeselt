import 'package:flutter/material.dart';

class Category {
  final String name;
  final String image;

  const Category({required this.name, required this.image});
}

const List<Category> categories = [
  Category(name: 'Bolo', image: 'assets/imagens/bolo.png'),
  Category(name: 'Bolo', image: 'assets/imagens/bolo.png'),
  Category(name: 'Bolo', image: 'assets/imagens/bolo.png'),
  Category(name: 'Bolo', image: 'assets/imagens/bolo.png'),
  Category(name: 'Bolo', image: 'assets/imagens/bolo.png'),
  Category(name: 'Bolo', image: 'assets/imagens/bolo.png'),
];

class Categorybar extends StatelessWidget {
  const Categorybar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Row(
          children:
              categories.map((category) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9.0),
                  child: Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage(category.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        category.name,
                        style: const TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              }).toList(), // <-- converte o Iterable em List<Widget>
        ),
      ),
    );
  }
}
