import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String cityName;
  final double temperature;
  final String description;
  final String iconUrl;

  const Weather({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.iconUrl,
  });

  @override
  List<Object?> get props => [
    cityName,
    temperature,
    description,
    iconUrl,
  ];
}