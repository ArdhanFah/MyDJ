import 'package:flutter/material.dart';
import 'package:mydj/data/data_provider.dart';
import 'package:provider/provider.dart';

class LihatJurnalPage extends StatefulWidget {
  const LihatJurnalPage({super.key, required this.title});
  final String title;
  @override
  State<LihatJurnalPage> createState() {
    return _LihatJurnalPageState(); // Seperti biasa, baris ini masih error.
  }
}

class _LihatJurnalPageState extends State<LihatJurnalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Consumer<DataProvider>(
          builder: (context, provider, child) {
            final daftarJurnal = provider.jurnalTersimpan;
            if (daftarJurnal.isEmpty) {
              return const Center(
                child: Text('Belum ada jurnal yang tersimpan.'),
              );
            }
            return ListView.separated(
              itemCount: daftarJurnal.length,
              separatorBuilder: (_, _) => const Divider(),
              itemBuilder: (context, index) {
                final jurnal = daftarJurnal[index];
                return ListTile(
                  title: Text('${jurnal.kelas} - ${jurnal.mapel}'),
                  subtitle: Text('Jam ke-${jurnal.jam}'),
                  trailing: Text(
                    '${jurnal.createdAt.day}/${jurnal.createdAt.month}/${jurnal.createdAt.year}',
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
