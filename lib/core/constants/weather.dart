class WeatherCondition {
  final int code;
  final String descriptionId;

  const WeatherCondition(this.code, this.descriptionId);

  static const Map<int, WeatherCondition> conditions = {
    0: WeatherCondition(0, 'Langit cerah'),
    1: WeatherCondition(1, 'Sebagian berawan'),
    2: WeatherCondition(2, 'Berawan'),
    3: WeatherCondition(3, 'Mendung'),
    45: WeatherCondition(45, 'Kabut'),
    61: WeatherCondition(61, 'Hujan ringan'),
    63: WeatherCondition(63, 'Hujan sedang'),
    65: WeatherCondition(65, 'Hujan lebat'),
    80: WeatherCondition(80, 'Hujan deras mendadak'),
    95: WeatherCondition(95, 'Badai petir'),
  };
  
  static WeatherCondition? getCondition(int code) {
    return conditions[code];
  }

  @override
  String toString() {
    return '$code: $descriptionId';
  }
}