import 'package:weather_app_task/features/weather/domain/entities/weather_entity.dart';

class WeatherModel {
  final Location location;
  final Current current;

  WeatherModel({
    required this.location,
    required this.current,
  });

  factory WeatherModel.fromJson(
      Map<String, dynamic> json,
      ) =>
      WeatherModel(
        location: Location.fromJson(
          json["location"] ?? {},
        ),
        current: Current.fromJson(
          json["current"] ?? {},
        ),
      );

  Map<String, dynamic> toJson() => {
    "location": location.toJson(),
    "current": current.toJson(),
  };

  Weather toEntity() {
    return Weather(
      cityName: location.name,
      temperature: current.tempC,
      description: current.condition.text,
      iconUrl: current.condition.icon,
    );
  }
}

class Current {
  final double tempC;
  final Condition condition;

  Current({
    required this.tempC,
    required this.condition,
  });

  factory Current.fromJson(
      Map<String, dynamic> json,
      ) =>
      Current(
        tempC: json["temp_c"]?.toDouble() ?? 0.0,
        condition: Condition.fromJson(
          json["condition"] ?? {},
        ),
      );

  Map<String, dynamic> toJson() => {
    "temp_c": tempC,
    "condition": condition.toJson(),
  };
}

class Condition {
  final String text;
  final String icon;

  Condition({
    required this.text,
    required this.icon,
  });

  factory Condition.fromJson(
      Map<String, dynamic> json,
      ) =>
      Condition(
        text: json["text"] ?? '',
        icon: _getFullIconUrl(
          json["icon"] ?? '',
        ),
      );

  Map<String, dynamic> toJson() => {
    "text": text,
    "icon": icon,
  };

  static String _getFullIconUrl(
      String iconUrl,
      ) {
    if (iconUrl.startsWith('//')) {
      return 'https:$iconUrl';
    }

    return iconUrl;
  }
}

class Location {
  final String name;

  Location({
    required this.name,
  });

  factory Location.fromJson(
      Map<String, dynamic> json,
      ) =>
      Location(
        name: json["name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}