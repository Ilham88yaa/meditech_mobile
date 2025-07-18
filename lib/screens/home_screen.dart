import 'package:flutter/material.dart';
import 'jadwal_konsultasi_screen.dart';
import 'booking_screen.dart';
import 'rekam_medis_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  String _userName = "Hilal Muhamad";

  final List<Map<String, dynamic>> _menuItems = [
    {
      'title': 'Jadwal Konsultasi',
      'image': 'assets/images/jadwalkonsultasi.png',
      'route': '/jadwal-konsultasi',
    },
    {
      'title': 'Booking',
      'image': 'assets/images/booking.png',
      'route': '/booking',
    },
    {
      'title': 'Rekam Medis',
      'image': 'assets/images/rekammedis.png',
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
      title: GestureDetector(
        onTap: () {
          // Navigasi ke profile saat tap pada area nama user
          _navigateToProfile();
        },
        child: Row(
          children: [
            Hero(
              tag: 'profile_avatar',
              child: CircleAvatar(
                backgroundColor: Color(0xFF9C88FF).withOpacity(0.1),
                child: Icon(Icons.person, color: Color(0xFF9C88FF)),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _userName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Tap untuk lihat profile',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications_outlined, color: Colors.grey[600]),
          onPressed: () {
            // TODO: Implement notification
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Fitur notifikasi akan segera hadir')),
            );
          },
        ),
        // Tambahkan tombol profile di actions
        IconButton(
          icon: Icon(Icons.person_outline, color: Colors.grey[600]),
          onPressed: _navigateToProfile,
          tooltip: 'Profile',
        ),
      ],
    );
  }

  // Method untuk navigasi ke profile dengan error handling
  void _navigateToProfile() {
    try {
      Navigator.pushNamed(context, '/profile').then((value) {
        // Reset bottom navigation index saat kembali dari profile
        setState(() {
          _currentIndex = 0;
        });
      });
    } catch (e) {
      // Error handling jika route tidak ditemukan
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal membuka halaman profile'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Widget _buildWelcomeSection() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
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
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              // Tambahkan quick access button ke profile
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF9C88FF).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.account_circle,
                    color: Color(0xFF9C88FF),
                    size: 28,
                  ),
                  onPressed: _navigateToProfile,
                  tooltip: 'Akun Saya',
                ),
              ),
            ],
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
        children:
            _menuItems.map((item) {
              return Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  child: _buildMenuCard(
                    title: item['title'],
                    image: item['image'],
                    onTap: () {
                      if (item['route'] == '/jadwal-konsultasi') {
                        Navigator.of(
                          context,
                        ).push(_fadeSlideRoute(const JadwalKonsultasiScreen()));
                      } else if (item['route'] == '/booking') {
                        Navigator.of(
                          context,
                        ).push(_fadeSlideRoute(const BookingScreen()));
                      } else if (item['route'] == '/medical-history') {
                        Navigator.of(
                          context,
                        ).push(_fadeSlideRoute(const RekamMedisScreen()));
                      }
                    },
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }

  PageRouteBuilder _fadeSlideRoute(Widget screen) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
    );
  }

  Widget _buildMenuCard({
    required String title,
    required String image,
    required VoidCallback onTap,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
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
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  image,
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback jika gambar tidak ditemukan
                    return Icon(
                      Icons.image_not_supported,
                      size: 40,
                      color: Colors.grey[400],
                    );
                  },
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

  Widget _buildProductCard({required String name, required String price}) {
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
                  style: TextStyle(fontSize: 10, color: Colors.grey[600]),
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

        switch (index) {
          case 0:
            // Tetap di home screen
            break;
          case 1:
            // Navigasi ke rekam medis
            Navigator.pushNamed(context, '/medical-history').then((value) {
              // Reset index saat kembali
              setState(() {
                _currentIndex = 0;
              });
            });
            break;
          case 2:
            // Navigasi ke profile
            _navigateToProfile();
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