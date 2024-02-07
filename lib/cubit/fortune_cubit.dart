import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'fortune_state.dart';

class FortuneCubit extends Cubit<FortuneState> {
  FortuneCubit() : super(FortuneInitial());
  int balance = 0;
  int win = 0;
  DateTime? expiryTime = DateTime.now();

  static const String _balanceKey = 'balance';
  static const String _timeKey = "time";

  Future<void> loadBalanceFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    balance = prefs.getInt(_balanceKey) ?? 0;
    int? expiryTimestamp = prefs.getInt(_timeKey);
    expiryTime = expiryTimestamp != null
        ? DateTime.fromMillisecondsSinceEpoch(expiryTimestamp)
        : null;
  }

  Future<void> saveDate() async {
    final prefs = await SharedPreferences.getInstance();

    DateTime newExpiryTime = DateTime.now().add(Duration(days: 1));
    await prefs.setInt(_timeKey, newExpiryTime.millisecondsSinceEpoch);
    await loadBalanceFromPrefs();
  }

  Future<void> _saveBalanceToPrefs(int balance) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_balanceKey, balance);
  }

  Future<void> _emitAndSaveBalance(int newBalance) async {
    emit(FortuneLoaded(balance: newBalance, win: win));
    await _saveBalanceToPrefs(newBalance);
  }

  void addBalance(int count) async {
    balance += count;
    win += count;
    await _emitAndSaveBalance(balance);
  }

  void removeBalance(int count) async {
    balance -= count;
    await _emitAndSaveBalance(balance);
  }

  void spotePlay(int index) {
    switch (index) {
      case 1:
        addBalance(10);
        break;

      case 2:
        addBalance(20);
        break;

      case 3:
        addBalance(15);
        break;

      case 4:
        addBalance(5);
        break;
      default:
    }
  }

  void roulettePlay(int index) {
    switch (index) {
      case 0:
        addBalance(100);
        break;
      case 1 || 12:
        addBalance(10);
        break;
      case 2:
        addBalance(50);
        break;
      case 3 || 6 || 11 || 14:
        addBalance(20);
        break;
      case 4 || 8:
        addBalance(0);
        break;
      case 5 || 13:
        addBalance(15);
        break;
      case 7:
        addBalance(5);
        break;
      case 9:
        addBalance(10000);
        break;
    }
  }
}
