import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final int totalItems;

  CartScreen({required this.totalItems});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Map<String, int> _cartQuantities = {
    "Sugar free gold (Rs.25)": 1,
    "Sugar free gold (Rs.18)": 1,
  };

  Map<String, double> _itemPrices = {
    "Sugar free gold (Rs.25)": 25.0,
    "Sugar free gold (Rs.18)": 18.0,
  };

  double _orderTotal = 0.0;

  @override
  void initState() {
    super.initState();
    _calculateTotal();
  }

  void _incrementQuantity(String item) {
    setState(() {
      _cartQuantities[item] = (_cartQuantities[item] ?? 1) + 1;
      _calculateTotal();
    });
  }

  void _decrementQuantity(String item) {
    setState(() {
      if (_cartQuantities[item]! > 1) {
        _cartQuantities[item] = (_cartQuantities[item] ?? 1) - 1;
        _calculateTotal();
      }
    });
  }

  void _calculateTotal() {
    _orderTotal = 0.0;
    _cartQuantities.forEach((item, quantity) {
      _orderTotal += (_itemPrices[item] ?? 0) * quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your cart'),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "+ Add more",
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.totalItems} Items in your cart",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildCartItem("Sugar free gold", "bottle of 500 pellets", "Rs.25"),
                  SizedBox(height: 16),
                  _buildCartItem("Sugar free gold", "bottle of 500 pellets", "Rs.18"),
                ],
              ),
            ),
            Divider(thickness: 1),
            SizedBox(height: 16),
            _buildSummaryRow("Order Total", "Rs.${_orderTotal.toStringAsFixed(2)}"),
            _buildSummaryRow("Items Discount", "-28.80"),
            _buildSummaryRow("Coupon Discount", "-15.80"),
            _buildSummaryRow("Shipping", "Free"),
            Divider(thickness: 1),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Rs.${(_orderTotal - 28.80 - 15.80).toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderConfirmationScreen()),
                  );
                },
                child: Text("Place Order"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(String title, String subtitle, String price) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset('assets/images/dawai.jpg', fit: BoxFit.cover),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                subtitle,
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                price,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ],
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove, color: Colors.grey),
              onPressed: () => _decrementQuantity("$title ($price)"),
            ),
            Text(
              "${_cartQuantities["$title ($price)"] ?? 1}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: Icon(Icons.add, color: Colors.blue),
              onPressed: () => _incrementQuantity("$title ($price)"),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String label, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey)),
          Text(amount, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

class OrderConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Confirmation'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 100),
              SizedBox(height: 24),
              Text(
                'Thank you for your order!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Your order has been successfully placed and is being processed.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Back to Cart"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
