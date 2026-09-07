import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

class UserPreferences with ChangeNotifier {
  String? _name;
  String? _email;
  String? _housingType;

  String? _location;
  double? _minBudget;
  double? _maxBudget;
  int? _bedrooms;
  int? _bathrooms;

  String? _houseType;

  bool? _selfContained;
  bool? _fenced;

  int? _guests;
  Map<String, bool> _airbnbAmenities = {};

  final List<String> _savedPropertyIds = [];

  UserPreferences();

  // --- Getters ---
  String? get name => _name;
  String? get email => _email;
  String? get housingType => _housingType;
  String? get location => _location;
  double? get minBudget => _minBudget;
  double? get maxBudget => _maxBudget;
  int? get bedrooms => _bedrooms;
  int? get bathrooms => _bathrooms;
  String? get houseType => _houseType;
  bool? get selfContained => _selfContained;
  bool? get fenced => _fenced;
  int? get guests => _guests;
  Map<String, bool> get airbnbAmenities => _airbnbAmenities;
  List<String> get savedPropertyIds => List.unmodifiable(_savedPropertyIds);

  // --- Setters / Updaters (local only, no persistence) ---

  void updateUserDetails({required String name, required String email}) {
    _name = name;
    _email = email;
    notifyListeners();
  }

  void updateHousingType(String type) {
    _housingType = type;
    _location = null;
    _minBudget = null;
    _maxBudget = null;
    _bedrooms = null;
    _bathrooms = null;
    _houseType = null;
    _selfContained = null;
    _fenced = null;
    _guests = null;
    _airbnbAmenities = {};
    notifyListeners();
  }

  void updateLocation(String? location) {
    _location = location;
    notifyListeners();
  }

  void updateBudgetRange({double? min, double? max}) {
    _minBudget = min;
    _maxBudget = max;
    notifyListeners();
  }

  void updateBedrooms(int? bedrooms) {
    _bedrooms = bedrooms;
    notifyListeners();
  }

  void updateBathrooms(int? bathrooms) {
    _bathrooms = bathrooms;
    notifyListeners();
  }

  void updateHouseType(String? type) {
    _houseType = type;
    notifyListeners();
  }

  void updateRentalDetails({bool? selfContained, bool? fenced}) {
    _selfContained = selfContained;
    _fenced = fenced;
    notifyListeners();
  }

  void updateAirbnbDetails({
    int? guests,
    Map<String, bool>? amenities,
  }) {
    _guests = guests;
    _airbnbAmenities = amenities ?? {};
    notifyListeners();
  }

  void toggleAirbnbAmenity(String amenityKey, bool value) {
    _airbnbAmenities[amenityKey] = value;
    notifyListeners();
  }

  void addSavedProperty(String propertyId) {
    if (!_savedPropertyIds.contains(propertyId)) {
      _savedPropertyIds.add(propertyId);
      notifyListeners();
      Logger('UserPreferences').info('Property $propertyId saved!');
    }
  }

  void removeSavedProperty(String propertyId) {
    if (_savedPropertyIds.remove(propertyId)) {
      notifyListeners();
      Logger('UserPreferences').info('Property $propertyId unsaved!');
    }
  }

  bool isPropertySaved(String propertyId) {
    return _savedPropertyIds.contains(propertyId);
  }

  void resetPreferences() {
    _name = null;
    _email = null;
    _housingType = null;
    _location = null;
    _minBudget = null;
    _maxBudget = null;
    _bedrooms = null;
    _bathrooms = null;
    _houseType = null;
    _selfContained = null;
    _fenced = null;
    _guests = null;
    _airbnbAmenities = {};
    _savedPropertyIds.clear();
    notifyListeners();
  }
}