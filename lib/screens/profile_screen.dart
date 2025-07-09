// screens/profile_screen.dart
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  // Profile Picture
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Colors.blue[400]!, Colors.blue[600]!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  // User Name
                  Text(
                    'Nama Pasien',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),
                  // User Email
                  Text(
                    'pasien@meditech.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 16),
                  // Edit Profile Button
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Navigate to edit profile
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[600],
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text('Edit Profile'),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 20),
            
            // Menu Items
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  // Personal Info Section
                  _buildSectionHeader('Informasi Personal'),
                  _buildMenuItem(
                    icon: Icons.person_outline,
                    title: 'Data Pribadi',
                    subtitle: 'Kelola informasi personal Anda',
                    onTap: () {
                      // TODO: Navigate to personal data
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.medical_information_outlined,
                    title: 'Riwayat Kesehatan',
                    subtitle: 'Lihat riwayat medis lengkap',
                    onTap: () {
                      Navigator.pushNamed(context, '/medical-history');
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.family_restroom,
                    title: 'Keluarga',
                    subtitle: 'Kelola profil keluarga',
                    onTap: () {
                      // TODO: Navigate to family profiles
                    },
                  ),
                  
                  Divider(height: 1),
                  
                  // Health Section
                  _buildSectionHeader('Kesehatan'),
                  _buildMenuItem(
                    icon: Icons.favorite_outline,
                    title: 'Kesehatan Saya',
                    subtitle: 'Monitor kondisi kesehatan',
                    onTap: () {
                      // TODO: Navigate to health monitoring
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.calendar_today_outlined,
                    title: 'Jadwal Konsultasi',
                    subtitle: 'Kelola jadwal konsultasi',
                    onTap: () {
                      // TODO: Navigate to consultation schedule
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.medication_outlined,
                    title: 'Obat & Suplemen',
                    subtitle: 'Kelola obat dan suplemen',
                    onTap: () {
                      // TODO: Navigate to medication
                    },
                  ),
                  
                  Divider(height: 1),
                  
                  // App Settings Section
                  _buildSectionHeader('Pengaturan'),
                  _buildMenuItem(
                    icon: Icons.notifications_outlined,
                    title: 'Notifikasi',
                    subtitle: 'Pengaturan notifikasi',
                    onTap: () {
                      // TODO: Navigate to notification settings
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.security_outlined,
                    title: 'Keamanan',
                    subtitle: 'Password dan keamanan akun',
                    onTap: () {
                      // TODO: Navigate to security settings
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.language_outlined,
                    title: 'Bahasa',
                    subtitle: 'Pilih bahasa aplikasi',
                    onTap: () {
                      // TODO: Navigate to language settings
                    },
                  ),
                  
                  Divider(height: 1),
                  
                  // Support Section
                  _buildSectionHeader('Bantuan & Dukungan'),
                  _buildMenuItem(
                    icon: Icons.help_outline,
                    title: 'Pusat Bantuan',
                    subtitle: 'FAQ dan panduan penggunaan',
                    onTap: () {
                      // TODO: Navigate to help center
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.contact_support_outlined,
                    title: 'Hubungi Kami',
                    subtitle: 'Kontak customer service',
                    onTap: () {
                      // TODO: Navigate to contact support
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.star_outline,
                    title: 'Beri Rating',
                    subtitle: 'Berikan rating untuk aplikasi',
                    onTap: () {
                      // TODO: Navigate to rating
                    },
                  ),
                  
                  Divider(height: 1),
                  
                  // Logout
                  _buildMenuItem(
                    icon: Icons.logout,
                    title: 'Keluar',
                    subtitle: 'Logout dari akun',
                    textColor: Colors.red,
                    onTap: () {
                      _showLogoutDialog(context);
                    },
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 20),
            
            // App Version
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    'Meditech App',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Version 1.0.0',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
  
  Widget _buildSectionHeader(String title) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.blue[600],
        ),
      ),
    );
  }
  
  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    Color? textColor,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: (textColor == Colors.red ? Colors.red[50] : Colors.blue[50]),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: textColor ?? Colors.blue[600],
          size: 22,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textColor ?? Colors.black87,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey[600],
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey[400],
      ),
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
    );
  }
  
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Logout'),
          content: Text('Apakah Anda yakin ingin keluar dari akun?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigate to login screen and clear all previous routes
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: Text('Keluar'),
            ),
          ],
        );
      },
    );
  }
}