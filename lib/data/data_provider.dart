import 'package:flutter/foundation.dart';
import 'package:mydj/data/jurnal.dart';

class DataProvider extends ChangeNotifier {
  final List<Jurnal> _jurnalTersimpan = [];

  void addNew(Jurnal jurnal) {
    _jurnalTersimpan.add(jurnal);
    notifyListeners();
  }

  List<Jurnal> get jurnalTersimpan => List.unmodifiable(_jurnalTersimpan);
}
