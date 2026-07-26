import 'package:flutter/material.dart';
import 'package:weather_app_task/core/extentions/size_extensions.dart';
import 'package:weather_app_task/core/thems/app_colors.dart';

class WeatherEmptyState extends StatelessWidget {
  const WeatherEmptyState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40.h,
        ),

        Container(
          width: 80.w,
          height: 80.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryLight,
          ),
          child: Icon(
            Icons.search,
            size: 40.w,
            color: AppColors.primary,
          ),
        ),

        SizedBox(
          height: 20.h,
        ),

        Text(
          'Search for a city',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),

        SizedBox(
          height: 8.h,
        ),

        Text(
          'Enter a city name above to see\n'
              'the current weather conditions.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}