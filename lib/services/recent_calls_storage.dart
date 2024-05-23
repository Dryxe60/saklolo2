import 'package:saklolo2/services_list.dart'; // Ensure this import is correct

class RecentCallsStorage {
  static final RecentCallsStorage _instance = RecentCallsStorage._internal();
  factory RecentCallsStorage() => _instance;

  RecentCallsStorage._internal();

  final List<EmergencyService> _recentCalls = [];

  List<EmergencyService> get recentCalls => _recentCalls;

  void addCall(EmergencyService service) {
    final timestampedService = service.copyWith(timestamp: DateTime.now()); // Add timestamp here
    _recentCalls.add(timestampedService);
    if (_recentCalls.length > 10) {
      _recentCalls.removeAt(0); // Keep only the latest 10 calls
    }
  }
}
