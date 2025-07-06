import 'package:flutter/material.dart';

class RekamMedisScreen extends StatelessWidget {
  const RekamMedisScreen({super.key});

  final List<Map<String, String>> rekamMedisData = const [
    {
      'dokter': 'dr. Indah Pratiwi',
      'spesialis': 'Dokter Umum',
      'tanggal': '3 Juli 2025',
      'diagnosa': 'Demam dan flu ringan',
    },
    {
      'dokter': 'dr. Agus Permana',
      'spesialis': 'Dokter Gigi',
      'tanggal': '4 Juli 2025',
      'diagnosa': 'Sakit gigi - diberikan antibiotik',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF6FF),
      appBar: AppBar(
        title: const Text("Rekam Medis"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: rekamMedisData.length,
        itemBuilder: (context, index) {
          final item = rekamMedisData[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.purple[50],
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 3,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['dokter']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text("Spesialis: ${item['spesialis']}"),
                Text("Tanggal: ${item['tanggal']}"),
                const SizedBox(height: 8),
                Text(
                  "Diagnosa: ${item['diagnosa']}",
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
