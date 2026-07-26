import 'package:flutter/material.dart';
import 'package:weather_app_task/core/extentions/size_extensions.dart';
import 'package:weather_app_task/core/thems/app_colors.dart';

class WeatherErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const WeatherErrorState({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 32.h,
        ),

        Container(
          width: 80.w,
          height: 80.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.errorBackground,
          ),
          child: Icon(
            Icons.cloud_off_outlined,
            size: 40.w,
            color: AppColors.error,
          ),
        ),

        SizedBox(
          height: 20.h,
        ),

        Text(
          'Something went wrong',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),

        SizedBox(
          height: 8.h,
        ),

        Text(
          message,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
            height: 1.4,
          ),
        ),

        SizedBox(
          height: 24.h,
        ),

        SizedBox(
          width: 160.w,
          height: 48.h,
          child: ElevatedButton(
            onPressed: onRetry,
            child: const Text(
              'Try Again',
            ),
          ),
        ),
      ],
    );
  }
}