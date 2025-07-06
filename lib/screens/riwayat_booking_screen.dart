import 'package:flutter/material.dart';

class RiwayatBookingScreen extends StatelessWidget {
  final List<String> bookingList;

  const RiwayatBookingScreen({super.key, required this.bookingList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Booking'),
        backgroundColor: Colors.deepPurple[300],
      ),
      body:
          bookingList.isEmpty
              ? const Center(child: Text('Belum ada riwayat booking.'))
              : ListView.builder(
                itemCount: bookingList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.history),
                    title: Text(bookingList[index]),
                  );
                },
              ),
    );
  }
}
