import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_task/core/extentions/size_extensions.dart';
import 'package:weather_app_task/core/thems/app_colors.dart';
import 'package:weather_app_task/features/weather/presentation/cubit/weather_cubit.dart';

class WeatherSearchSection extends StatefulWidget {
  final TextEditingController controller;

  const WeatherSearchSection({
    super.key,
    required this.controller,
  });

  @override
  State<WeatherSearchSection> createState() =>
      _WeatherSearchSectionState();
}

class _WeatherSearchSectionState
    extends State<WeatherSearchSection> {
  void _search() {
    FocusScope.of(context).unfocus();

    context.read<WeatherCubit>().getWeather(
      widget.controller.text,
    );
  }

  void _clear() {
    widget.controller.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: widget.controller,
          textInputAction: TextInputAction.search,
          onChanged: (_) => setState(() {}),
          onSubmitted: (_) => _search(),
          decoration: InputDecoration(
            hintText: 'Enter city name',
            prefixIcon: Icon(
              Icons.location_on_outlined,
              size: 22.h,
              color: AppColors.searchIcon,
            ),
            suffixIcon: widget.controller.text.isNotEmpty
                ? IconButton(
              onPressed: _clear,
              icon: Icon(
                Icons.close,
                size: 20.h,
                color: AppColors.searchIcon,
              ),
            )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                14.w,
              ),
            ),
          ),
        ),

        SizedBox(
          height: 12.h,
        ),

        SizedBox(
          width: double.infinity,
          height: 48.h,
          child: ElevatedButton.icon(
            onPressed: _search,
            icon: Icon(
              Icons.search,
              size: 20.h,
            ),
            label: Text(
              'Search',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(
                color: AppColors.buttonText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}