import 'package:flutter/material.dart';
import 'cart_screen.dart';
import 'home_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/man.jpg'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, Hamza Rehman",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Welcome to Quick Medical Store",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(),

          // Profile Options
          ListTile(
            leading: Icon(Icons.edit, color: Colors.blue),
            title: Text("Edit Profile"),
            trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.receipt, color: Colors.blue),
            title: Text("My orders"),
            trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet, color: Colors.blue),
            title: Text("Billing"),
            trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.help_outline, color: Colors.blue),
            title: Text("Faq"),
            trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            onTap: () {},
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blue[300],
        currentIndex: 3,
        onTap: (int index) {
          if (index == 2) {

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartScreen(totalItems: 0)),
            );
          } else if(index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
