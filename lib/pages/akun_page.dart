import 'package:flutter/material.dart';
import 'package:mydj/components/password_field.dart';

class AkunPage extends StatefulWidget {
  const AkunPage({super.key, required this.title});
  final String title;
  @override
  State<AkunPage> createState() {
    return _AkunPageState(); // Seperti biasa, baris ini masih error.
  }
}

class _AkunPageState extends State<AkunPage> {
  String sandiSaatIni = '';
  String sandiBaru = '';
  String konfirmasiSandi = '';

  void _savePassword() {
    if (sandiBaru.isEmpty || sandiBaru != konfirmasiSandi) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Konfirmasi sandi tidak sesuai')),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sandi berhasil disimpan')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ganti Sandi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 2),
            const SizedBox(height: 10),
            const Text('Sandi Saat Ini'),
            const SizedBox(height: 10),
            PasswordField(onChanged: (value) => sandiSaatIni = value),
            const SizedBox(height: 16),
            const Text('Sandi Baru'),
            const SizedBox(height: 10),
            PasswordField(onChanged: (value) => sandiBaru = value),
            const SizedBox(height: 16),
            const Text('Konfirmasi Sandi Baru'),
            const SizedBox(height: 10),
            PasswordField(onChanged: (value) => konfirmasiSandi = value),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _savePassword,
                child: const Text('Simpan'),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Keluar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
