import 'package:flutter/material.dart';

import 'cart_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final String image;
  final String name;
  final String description;
  final String price;

  ProductDetailScreen({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _cartCount = 0;

  void _incrementCartCount() {
    setState(() {
      _cartCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                },
              ),
              if (_cartCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '$_cartCount',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(widget.image, width: 150, height: 150),
            ),
            SizedBox(height: 16),
            Text(
              widget.name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.description,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text(
                  "Rs.99",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  widget.price,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: _incrementCartCount,
                  child: Text("Add to cart"),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              "Package size",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildPackageOption("Rs.106", "50 pellets"),
                _buildPackageOption("Rs.166", "110 pellets"),
                _buildPackageOption("Rs.252", "300 pellets"),
              ],
            ),
            SizedBox(height: 24),
            Text(
              "Product Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Text(
              "Ingredients",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio.",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Text(
              "Expiry Date",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text("25/12/2023", style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 16),
            Text(
              "Brand Name",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text("Something", style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 24),
            _buildRatingSection(),
            SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(totalItems: _cartCount),
                  ),
                );
              },
              child: Text(
                "GO TO CART",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPackageOption(String price, String size) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(price, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          Text(size, style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildRatingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "4.4",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.amber),
        ),
        Row(
          children: [
            Icon(Icons.star, color: Colors.amber, size: 24),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "4.4 star",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text("923 Ratings and 257 Reviews", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
        SizedBox(height: 16),
        _buildRatingBar("5", 67),
        _buildRatingBar("4", 20),
        _buildRatingBar("3", 7),
        _buildRatingBar("2", 2),
        _buildRatingBar("1", 4),
      ],
    );
  }

  Widget _buildRatingBar(String star, int percentage) {
    return Row(
      children: [
        Text(star, style: TextStyle(fontSize: 16)),
        SizedBox(width: 8),
        Expanded(
          child: LinearProgressIndicator(
            value: percentage / 100,
            color: Colors.amber,
            backgroundColor: Colors.grey[200],
          ),
        ),
        SizedBox(width: 8),
        Text("$percentage%", style: TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }
}
