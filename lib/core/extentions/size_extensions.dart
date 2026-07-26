

import 'package:weather_app_task/core/helper/app_size_config.dart';

extension ResponsiveSizeExtension on num {
double get h => SizeConfig.getHeight(this);

double get w => SizeConfig.getWidth(this);

double get sp => SizeConfig.getFont(this);
}

