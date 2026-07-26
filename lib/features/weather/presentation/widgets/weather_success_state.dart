import 'package:flutter/material.dart';
import 'package:weather_app_task/core/extentions/size_extensions.dart';
import 'package:weather_app_task/core/thems/app_colors.dart';
import 'package:weather_app_task/features/weather/domain/entities/weather_entity.dart';

class WeatherSuccessState extends StatelessWidget {
  final Weather weather;

  const WeatherSuccessState({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [


        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 24.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(
              24.w,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),

              Text(
                weather.cityName,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),

              SizedBox(
                height: 16.h,
              ),
              Image.network(
                weather.iconUrl,
                width: 80.h,
                height: 80.h,
                fit: BoxFit.contain,
                errorBuilder: (
                    context,
                    error,
                    stackTrace,
                    ) {
                  return Icon(
                    Icons.cloud,
                    size: 70.h,
                    color: AppColors.textSecondary,
                  );
                },
              ),

              SizedBox(
                height: 12.h,
              ),

              Text(
                '${weather.temperature.round()}°C',
                style: Theme.of(context).textTheme.displaySmall,
              ),

              SizedBox(
                height: 8.h,
              ),

              Text(
                weather.description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}