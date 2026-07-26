import 'package:flutter/material.dart';
import 'package:weather_app_task/core/extentions/size_extensions.dart';
import 'package:weather_app_task/core/thems/app_colors.dart';

class WeatherLoadingState extends StatelessWidget {
  const WeatherLoadingState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60.h,
        ),

        SizedBox(
          width: 40.w,
          height: 40.h,
          child: CircularProgressIndicator(
            color: AppColors.loading,
          ),
        ),

        SizedBox(
          height: 24.h,
        ),

        Text(
          'Fetching weather data...',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),

        SizedBox(
          height: 8.h,
        ),

        Text(
          'Please wait a moment',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}