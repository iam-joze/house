class Property {
  final String id;
  final String type; // 'airbnb', 'rental', 'permanent'
  final String title;
  final String description;
  final String imageUrl;
  final String location;
  final double price; // Per month for rental/permanent, per night for Airbnb
  final double latitude;
  final double longitude;
  final int bedrooms;
  final int bathrooms;
  final double areaSqFt; // Square footage

  // Type-specific properties
  final String? houseType; // e.g., 'apartment', 'bungalow', 'condo' (for permanent)
  final bool? selfContained; // For rental
  final bool? fenced; // For rental
  final List<DateTime>? availableDates; // For Airbnb
  final Map<String, bool>? amenities; // e.g., {'wifi': true, 'kitchen': true} for Airbnb

  // Algorithm specific
  int? clusterId;
  double? matchScore;
  double? distanceKm;

  Property({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.location,
    required this.price,
    required this.latitude,
    required this.longitude,
    required this.bedrooms,
    required this.bathrooms,
    required this.areaSqFt,
    this.houseType,
    this.selfContained,
    this.fenced,
    this.availableDates,
    this.amenities,
    this.clusterId,
    this.matchScore,
    this.distanceKm,
  });

  // Helper to update algorithm-related fields
  Property copyWith({
    String? id,
    String? type,
    String? title,
    String? description,
    String? imageUrl,
    String? location,
    double? price,
    double? latitude,
    double? longitude,
    int? bedrooms,
    int? bathrooms,
    double? areaSqFt,
    String? houseType,
    bool? selfContained,
    bool? fenced,
    List<DateTime>? availableDates,
    Map<String, bool>? amenities,
    int? clusterId,
    double? matchScore,
    double? distanceKm,
  }) {
    return Property(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      location: location ?? this.location,
      price: price ?? this.price,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      bedrooms: bedrooms ?? this.bedrooms,
      bathrooms: bathrooms ?? this.bathrooms,
      areaSqFt: areaSqFt ?? this.areaSqFt,
      houseType: houseType ?? this.houseType,
      selfContained: selfContained ?? this.selfContained,
      fenced: fenced ?? this.fenced,
      availableDates: availableDates ?? this.availableDates,
      amenities: amenities ?? this.amenities,
      clusterId: clusterId ?? this.clusterId,
      matchScore: matchScore ?? this.matchScore,
      distanceKm: distanceKm ?? this.distanceKm,
    );
  }
}