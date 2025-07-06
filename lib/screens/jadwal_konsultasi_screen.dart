import 'package:flutter/material.dart';
import 'konsultasi_model.dart';
import 'jadwal_konsultasi_card.dart';

class JadwalKonsultasiScreen extends StatelessWidget {
  const JadwalKonsultasiScreen({super.key});

  static const List<Konsultasi> dummyData = [
    Konsultasi(
      dokter: "dr. Indah Pratiwi",
      tanggal: "5 Juli 2025",
      waktu: "10:00 - 11:00",
      spesialis: "Dokter Umum",
    ),
    Konsultasi(
      dokter: "dr. Agus Permana",
      tanggal: "6 Juli 2025",
      waktu: "14:00 - 15:00",
      spesialis: "Dokter Gigi",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jadwal Konsultasi"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: JadwalKonsultasiCard(konsultasi: dummyData[index]),
            );
          },
        ),
      ),
    );
  }
}
