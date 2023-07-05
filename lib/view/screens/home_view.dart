import 'package:flutter/material.dart';
import 'package:ots_test/core/models/car_model.dart';
import 'package:ots_test/view/widgets/dropdown_button_wrapper.dart';
import 'package:ots_test/view/widgets/input_decorations.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController distanceController = TextEditingController(text: "0.0");
  String time = "Please Enter sth";
  CarModel carModel = CarModel.bike();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Calc Average Time",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        body: ListView(
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: title("Count averge time"),
            )),
            Row(
              children: [
                title("Distance: "),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: distanceController,
                      decoration: InputDecorations.customInputDecoration(
                        hintText: "KM",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    "Km",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                title("Car Type: "),
                Expanded(
                  child: DropdownButtonWrapper(
                    initalValue: "Bike",
                    underLineHeight: 0,
                    list: const [
                      "Bike",
                      "Motorcycle",
                      "Car",
                      "Truck",
                    ],
                    textStyle: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.grey),
                    callBack: (value) {
                      setState(() {
                        carModel = carTypeOnChange(value);
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            carDetail(context, "Type : ${carModel.carType.name}"),
            carDetail(context, "Max Speed : ${carModel.maxSpeed} Km/h"),
            carDetail(context, "Min Speed : ${carModel.minSpeed} Km/h"),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                carDetail(
                  context,
                  "Current Speed : ${carModel.carSpeed.toStringAsFixed(2)} Km/h",
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0, left: 8, right: 8),
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          carModel.generateCarSpeed();
                        });
                      },
                      child: const Icon(
                        Icons.refresh,
                        size: 24,
                      )),
                )
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(26.0),
                child: Column(
                  children: [
                    Text(
                      "Time",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      time,
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: count,
                child: Text(
                  "Count",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding carDetail(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 6),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }

  void count() {
    setState(() {
      time =
          "${carModel.countTimeWithDistance(double.parse(distanceController.text)).toStringAsFixed(2)} minute";
    });
  }

  CarModel carTypeOnChange(String value) {
    switch (value) {
      case "Motorcycle":
        return CarModel.motorcycle();
      case "Car":
        return CarModel.car();
      case "Truck":
        return CarModel.truck();
      case "Bike":
      default:
        return CarModel.bike();
    }
  }

  Widget title(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
