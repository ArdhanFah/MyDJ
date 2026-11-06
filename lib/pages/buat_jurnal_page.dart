import 'package:flutter/material.dart';
import 'package:mydj/data/data_provider.dart';
import 'package:mydj/data/jurnal.dart';
import 'package:mydj/components/media_selector.dart';
import 'package:provider/provider.dart';

class BuatJurnalPage extends StatefulWidget {
  final String title = 'Buat Jurnal';
  const BuatJurnalPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _BuatJurnalPageState();
  }
}

class _BuatJurnalPageState extends State<BuatJurnalPage> {
  final _formKey = GlobalKey<FormState>();
  String kelas = '';
  String mapel = '';
  int jamKe = 0;
  String tujuanPembelajaran = '';
  String materiTopikPembelajaran = '';
  String kegiatanPembelajaran = '';
  String dimensiProfilPelajarPancasila = '';

  Widget _textArea(
    String label,
    String hint,
    ValueChanged<String> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: hint,
          ),
          maxLines: 4,
          onChanged: onChanged,
          validator: (value) => value == null || value.trim().isEmpty
              ? '$label wajib diisi'
              : null,
        ),
      ],
    );
  }

  void _saveJurnal() {
    if (!_formKey.currentState!.validate() || jamKe == 0) {
      if (jamKe == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Jam ke- wajib dipilih')),
        );
      }
      return;
    }

    context.read<DataProvider>().addNew(
          Jurnal(
            kelas: kelas,
            mapel: mapel,
            jam: jamKe,
            tujuanPembelajaran: tujuanPembelajaran,
            materiTopikPembelajaran: materiTopikPembelajaran,
            kegiatanPembelajaran: kegiatanPembelajaran,
            dimensiProfilPelajarPancasila: dimensiProfilPelajarPancasila,
          ),
        );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Jurnal berhasil disimpan')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Kelas'),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan Kelas',
                ),
                onChanged: (value) => kelas = value,
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Kelas wajib diisi'
                    : null,
              ),
              const SizedBox(height: 10),
              const Text('Nama Mapel'),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan Nama Mapel',
                ),
                onChanged: (value) => mapel = value,
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Nama mapel wajib diisi'
                    : null,
              ),
              const SizedBox(height: 10),
              const Text('Jam Ke-'),
              const SizedBox(height: 10),
              DropdownButtonFormField<int>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Pilih Jam',
                ),
                items: List.generate(
                  8,
                  (index) => DropdownMenuItem(
                    value: index + 1,
                    child: Text('${index + 1}'),
                  ),
                ),
                onChanged: (value) => setState(() => jamKe = value ?? 0),
              ),
              const SizedBox(height: 10),
              _textArea(
                'Tujuan Pembelajaran',
                'Masukkan Tujuan Pembelajaran',
                (text) => tujuanPembelajaran = text,
              ),
              const SizedBox(height: 10),
              _textArea(
                'Materi/Topik Pembelajaran',
                'Masukkan Materi/Topik Pembelajaran',
                (text) => materiTopikPembelajaran = text,
              ),
              const SizedBox(height: 10),
              _textArea(
                'Kegiatan Pembelajaran',
                'Masukkan Kegiatan Pembelajaran',
                (text) => kegiatanPembelajaran = text,
              ),
              const SizedBox(height: 10),
              _textArea(
                'Dimensi Profil Pelajar Pancasila',
                'Tuliskan Dimensi Profil Pelajar Pancasila',
                (text) => dimensiProfilPelajarPancasila = text,
              ),
              const SizedBox(height: 10),
              const Text('Foto Kegiatan'),
              const SizedBox(height: 10),
              const MediaSelector(),
              const SizedBox(height: 10),
              const Text('Video Kegiatan'),
              const SizedBox(height: 10),
              const MediaSelector(mediaType: MediaType.video),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveJurnal,
                  child: const Text('Simpan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
