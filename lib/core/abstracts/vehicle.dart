import 'package:ots_test/core/enums/car_type.dart';

abstract class Vehicle {
  late int wheelCount;
  late double weight;
  late double minSpeed;
  late double maxSpeed;

  Vehicle({
    required this.maxSpeed,
    required this.minSpeed,
    required this.wheelCount,
    required this.weight,
  });

  double getMaxSpeed();
  double getMinSpeed();
  double getCurrentSpeed();
  double countTimeWithDistance(double distance);
}
