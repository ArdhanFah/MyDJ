import 'package:flutter/foundation.dart';
import 'package:mydj/data/jurnal.dart';

class DataProvider extends ChangeNotifier {
  final List<Jurnal> _jurnalTersimpan = [];
  String _password = 'guru';

  void addNew(Jurnal jurnal) {
    _jurnalTersimpan.add(jurnal);
    notifyListeners();
  }

  List<Jurnal> get jurnalTersimpan => List.unmodifiable(_jurnalTersimpan);

  bool verifyPassword(String password) => password == _password;

  void changePassword(String password) {
    _password = password;
    notifyListeners();
  }
}
