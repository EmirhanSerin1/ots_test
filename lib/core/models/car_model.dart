import 'dart:math';

import 'package:ots_test/core/abstracts/vehicle.dart';
import 'package:ots_test/core/enums/car_type.dart';

class CarModel extends Vehicle {
  double carSpeed = 0.0;
  late CarType carType;

  CarModel({
    CarType? carType,
    required double maxSpeed,
    required double minSpeed,
    required int wheelCount,
    required double carWeight,
  })  : carType = carType ?? CarType.bike,
        super(
          maxSpeed: maxSpeed,
          minSpeed: minSpeed,
          wheelCount: wheelCount,
          weight: carWeight,
        ) {
    _init();
  }

  CarModel.bike({
    CarType? carType,
  })  : carType = carType ?? CarType.bike,
        super(
          maxSpeed: 30,
          minSpeed: 10,
          wheelCount: 2,
          weight: 10.15,
        ) {
    _init();
  }
  CarModel.motorcycle({
    CarType? carType,
  })  : carType = carType ?? CarType.bike,
        super(
          maxSpeed: 376.363,
          minSpeed: 85.5,
          wheelCount: 2,
          weight: 136.9,
        );
  CarModel.car({
    CarType? carType,
  })  : carType = carType ?? CarType.bike,
        super(
          maxSpeed: 278,
          minSpeed: 22.4,
          wheelCount: 4,
          weight: 2500,
        ) {
    _init();
  }

  CarModel.truck({
    CarType? carType,
  })  : carType = carType ?? CarType.bike,
        super(
          maxSpeed: 85.6,
          minSpeed: 3.5,
          wheelCount: 4,
          weight: 14000,
        ) {
    _init();
  }

  @override
  double getMaxSpeed() {
    return maxSpeed;
  }

  @override
  double getMinSpeed() {
    return minSpeed;
  }

  @override
  double getCurrentSpeed() {
    return carSpeed;
  }

  CarType getVehicleType() {
    return carType;
  }

  @override
  double countTimeWithDistance(double distance) {
    double timeInHours = distance / getCurrentSpeed();
    double timeInMinutes = timeInHours * 60;
    return timeInMinutes;
  }

  void generateCarSpeed() {
    carSpeed = Random().nextDouble() * (maxSpeed - minSpeed) + minSpeed;
  }

  void _init() {}
}
