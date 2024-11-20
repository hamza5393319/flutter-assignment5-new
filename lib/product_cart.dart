import 'package:flutter/material.dart';
import 'package:flutter_assignment_5_new/screens/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final String price;
  final VoidCallback onAddToCart;

  ProductCard({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailScreen(
                        image: image,
                        name: name,
                        description: description,
                        price: price,
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(name, style: TextStyle(fontSize: 14)),
            Text(description, style: TextStyle(fontSize: 12, color: Colors.grey)),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(price, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: Icon(Icons.add_shopping_cart, color: Colors.orange),
                  onPressed: onAddToCart,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

