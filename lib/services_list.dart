class EmergencyService {
  final String name;
  final String number;
  final String department;
  final String distance;
  final String logoPath;
  final DateTime? timestamp; // Add the timestamp property

  EmergencyService({
    required this.name,
    required this.number,
    required this.department,
    required this.distance,
    required this.logoPath,
    this.timestamp, // Add this line
  });

  EmergencyService copyWith({
    String? name,
    String? number,
    String? department,
    String? distance,
    String? logoPath,
    DateTime? timestamp,
  }) {
    return EmergencyService(
      name: name ?? this.name,
      number: number ?? this.number,
      department: department ?? this.department,
      distance: distance ?? this.distance,
      logoPath: logoPath ?? this.logoPath,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}

final List<EmergencyService> emergencyServices = [
  EmergencyService(
    name: "Koronadal Police Station",
    number: "09497069194",
    department: "Police Station",
    distance: "2 km",
    logoPath: "assets/koronadal_police.png",
  ),

  EmergencyService(
    name: "Koronadal Fire Station",
    number: "228-5519",
    department: "Fire Department",
    distance: "2 km",
    logoPath: "assets/koronadal_BFP.png",
  ),

  EmergencyService(
    name: "SocoMedics",
    number: "(083) 228 8202",
    department: "Medical Center",
    distance: "2 km",
    logoPath: "assets/socomedics.jpg",
  ),

  EmergencyService(
    name: "Dr. Arturo P. Pingoy Medical Center ",
    number: "(083) 228 2202",
    department: "Medical Center",
    distance: "2 km",
    logoPath: "assets/pingoy.png",
  ),

  EmergencyService(
    name: "Allah Valley Hospital",
    number: "(083) 228 3550",
    department: "Hospital",
    distance: "2 km",
    logoPath: "assets/allahvalley.png",
  ),

  EmergencyService(
    name: "Tantangan Fire Station",
    number: "09309722965",
    department: "Fire Department",
    distance: "2 km",
    logoPath: "assets/tantangan_BFP.png",
  ),

  EmergencyService(
    name: "Tampakan Police Station",
    number: "09284511059",
    department: "Police Station",
    distance: "2 km",
    logoPath: "assets/tampakan_police.png",
  ),

  EmergencyService(
    name: "Tantangan Police Station",
    number: "0906 146 6070",
    department: "Police Station",
    distance: "2 km",
    logoPath: "assets/tantangan_police.png",
  ),



  // Add more services as needed
];

// Default service if none is found (make sure this is properly defined)
final EmergencyService defaultService = EmergencyService(
  name: "Unknown",
  number: "N/A",
  department: "Unknown",
  distance: "Unknown",
  logoPath: "assets/unknown.png",
);
