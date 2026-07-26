import 'package:flutter/material.dart';
import 'package:weather_app_task/core/extentions/size_extensions.dart';
import 'package:weather_app_task/core/thems/app_colors.dart';

class WeatherHeader extends StatelessWidget {
  const WeatherHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        24.w,
        40.h,
        24.w,
        50.h,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryLight,
            AppColors.primary,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weather',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.white,
            ),
          ),

          SizedBox(
            height: 8.h,
          ),

          Text(
            'Get the latest weather\ninformation for any city.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.white,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}