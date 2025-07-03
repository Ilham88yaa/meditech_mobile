// screens/home_screen.dart
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  String _userName = "Nama Pasien";

  final List<Map<String, dynamic>> _menuItems = [
    {
      'title': 'Jadwal\nKonsultasi',
      'icon': Icons.schedule,
      'color': Colors.blue,
      'route': '/consultation',
    },
    {
      'title': 'Booking',
      'icon': Icons.book_online,
      'color': Colors.green,
      'route': '/consultation',
    },
    {
      'title': 'Rekam\nMedis',
      'icon': Icons.medical_information,
      'color': Colors.orange,
      'route': '/medical-history',
    },
  ];

  final List<Map<String, String>> _healthProducts = [
    {'name': 'Vitamin C', 'price': 'Rp 25.000'},
    {'name': 'Paracetamol', 'price': 'Rp 15.000'},
    {'name': 'Antimo', 'price': 'Rp 8.000'},
    {'name': 'Betadine', 'price': 'Rp 12.000'},
    {'name': 'Bodrex', 'price': 'Rp 10.000'},
    {'name': 'OBH Combi', 'price': 'Rp 18.000'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWelcomeSection(),
            _buildMenuSection(),
            _buildProductsSection(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          CircleAvatar(
            backgroundColor: Color(0xFF9C88FF).withOpacity(0.1),
            child: Icon(
              Icons.person,
              color: Color(0xFF9C88FF),
            ),
          ),
          SizedBox(width: 12),
          Text(
            _userName,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications_outlined,
            color: Colors.grey[600],
          ),
          onPressed: () {
            // Handle notification tap
          },
        ),
      ],
    );
  }

  Widget _buildWelcomeSection() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selamat datang di Meditech',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Kesehatan Anda adalah prioritas kami',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _menuItems.map((item) {
          return Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: _buildMenuCard(
                title: item['title'],
                icon: item['icon'],
                color: item['color'],
                onTap: () {
                  Navigator.pushNamed(context, item['route']);
                },
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMenuCard({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[200]!),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: color,
                size: 24,
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductsSection() {
    return Container(
      margin: EdgeInsets.only(top: 24),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Produk Kesehatan Andalan',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 3,
            ),
            itemCount: _healthProducts.length,
            itemBuilder: (context, index) {
              final product = _healthProducts[index];
              return _buildProductCard(
                name: product['name']!,
                price: product['price']!,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard({
    required String name,
    required String price,
  }) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Color(0xFF9C88FF).withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(
              Icons.medical_services,
              color: Color(0xFF9C88FF),
              size: 16,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
        
        // Handle navigation based on index
        switch (index) {
          case 0:
            // Already on home
            break;
          case 1:
            Navigator.pushNamed(context, '/medical-history');
            break;
          case 2:
            Navigator.pushNamed(context, '/profile');
            break;
        }
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xFF9C88FF),
      unselectedItemColor: Colors.grey[400],
      elevation: 8,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.description),
          label: 'Rekam Medis',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}