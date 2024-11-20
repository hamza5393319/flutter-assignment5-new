import 'package:flutter/material.dart';
import '../authintication/signUpScreen.dart';
import 'cart_screen.dart';
import 'profile_screen.dart';
import '../product_cart.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _cartCount = 0;
  bool _hasNotification = true;

  final List<Map<String, dynamic>> products = List.generate(10, (index) => {
    'image': 'assets/images/dawai.jpg',
    'name': 'Product ${index + 1}',
    'description': 'Description ${index + 1}',
    'price': 'Rs.${100 + index * 10}',
  });

  void _onBottomNavTap(int index) {
    if (index == 2) {
      _navigateToCartScreen();
    } else if (index == 3) {
      _navigateToProfileScreen();
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _navigateToCartScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartScreen(totalItems: _cartCount),
      ),
    );
  }

  void _navigateToProfileScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileScreen(),
      ),
    );
  }

  void _navigateToSignUpScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpScreen(),
      ),
    );
  }

  void _addToCart() {
    setState(() {
      _cartCount += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/man.jpg'),
                  radius: 25,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hi, Hamza Rehman',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      'Welcome to Quick Medical Store',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
                Spacer(),
                _buildNotificationIcon(),
                _buildCartIcon(),
                IconButton(
                  icon: Icon(Icons.logout, color: Colors.white),
                  onPressed: _navigateToSignUpScreen,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            _buildTopCategories(),
            _buildPromotionBanner(),
            _buildDealsOfTheDay(screenWidth),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Medicine & Healthcare products',
          prefixIcon: Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildTopCategories() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top Categories',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            height: 120,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 16),
              children: [
                _buildCategoryCard('Dental', Colors.pink),
                _buildCategoryCard('Wellness', Colors.green),
                _buildCategoryCard('Homeo', Colors.orange),
                _buildCategoryCard('Eye Care', Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromotionBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/banner.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Save extra on every order',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDealsOfTheDay(double screenWidth) {
    final crossAxisCount = screenWidth < 600 ? 2 : 4;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deals of the Day',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.65,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(
                image: products[index]['image'],
                name: products[index]['name'],
                description: products[index]['description'],
                price: products[index]['price'],
                onAddToCart: _addToCart,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, Color color) {
    return Container(
      width: 80,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildNotificationIcon() {
    return Stack(
      children: [
        IconButton(
          icon: Icon(Icons.notifications, color: Colors.white),
          onPressed: () {
            setState(() {
              _hasNotification = false;
            });
          },
        ),
        if (_hasNotification)
          Positioned(
            right: 7,
            top: 7,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildCartIcon() {
    return Stack(
      children: [
        IconButton(
          icon: Icon(Icons.shopping_cart, color: Colors.white),
          onPressed: _navigateToCartScreen,
        ),
        if (_cartCount > 0)
          Positioned(
            right: 7,
            top: 7,
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
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.blue[300],
      currentIndex: _selectedIndex,
      onTap: _onBottomNavTap,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.category), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
      ],
    );
  }
}
