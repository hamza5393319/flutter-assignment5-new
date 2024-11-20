import 'package:flutter/material.dart';

import 'login_screen.dart';

class WalkThroughScreen extends StatefulWidget {
  @override
  _WalkThroughScreenState createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'image': 'assets/images/medicalpic.png',
      'title': 'View and buy\nMedicine online',
      'description': 'Etiam mollis metus non purus \nfaucibus sollicitudin. Pellentesque \nsagittis mi. Integer..',
    },
    {
      'image': 'assets/images/medicalpic2.jpg',
      'title': 'Fast Delivery',
      'description': 'Quick and safe delivery to your doorstep.',
    },
    {
      'image': 'assets/images/medicalpic3.jpg',
      'title': 'Easy Payments',
      'description': 'Secure and fast payment options available.',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    }
  }

  void _onSkipPressed() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          page['image']!,
                          height: 250,
                        ),
                        SizedBox(height: 20),
                        Text(
                          page['title']!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          page['description']!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: _onSkipPressed,
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Row(
                    children: List.generate(
                      _pages.length,
                          (index) => _buildDot(isActive: index == _currentPage),
                    ),
                  ),
                  TextButton(
                    onPressed: _onNextPressed,
                    child: Text(
                      _currentPage == _pages.length - 1 ? 'Finish' : 'Next',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDot({required bool isActive}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      width: isActive ? 10.0 : 6.0,
      height: isActive ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
