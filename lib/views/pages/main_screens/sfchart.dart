import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../models/hive_services/data_model.dart';
import '../../../utils/BlurryContainer.dart';
import '../../../utils/app_background_image.dart';

class WaterProgressChart extends StatefulWidget {
  const WaterProgressChart({super.key});

  @override
  _WaterProgressChartState createState() => _WaterProgressChartState();
}

class _WaterProgressChartState extends State<WaterProgressChart> {
  int _waterGoal = 0;
  int _waterCount = 0;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final waterGoalBox = Watergoal.getdata();
    final drinkBox = Drinkbox.getdata();

    setState(() {
      //waterGoalBox.get(0)!.addgoal retrieves the first (and only) Watergoal object from a Box object
      // named waterGoalBox and gets the value of its addgoal property,
      // which represents the goal amount of water to be consumed.

      _waterGoal = waterGoalBox.get(0)!.addgoal;
      _waterCount =
          drinkBox.values.fold(0, (sum, drink) => sum + drink.addWater);

      //drinkBox.values.fold(0, (sum, drink) => sum + drink.addWater) retrieves all the Drink objects
      // from a Box object named drinkBox and calculates the total amount of water consumed
      // (_waterCount) by iterating through the Drink objects using the fold() function. The fold()
      //function takes an initial value of 0 for the sum accumulator and a function that combines the accumulator
      //and the next element of the iterable. The function used here adds the addWater value of each Drink object
      // to the sum accumulator for the _waterCount.
    });
  }



  


  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SfCircularChart(
            series: <CircularSeries>[
              PieSeries<ChartData, String>(
                //The chart data is defined using a list of ChartData objects, which have two properties:
                //a category (either "Water Count" or "Remaining"),
                // and a value (either the amount of water consumed or the
                //remaining amount needed to reach the goal).
                dataSource: <ChartData>[
                  ChartData('Water Count', _waterCount),
                  ChartData('Remaining count', _waterGoal - _waterCount),
                  //The dataSource property of the PieSeries widget is set to this list of ChartData objects.
                ],
                xValueMapper: (ChartData data, _) => data.category,
                yValueMapper: (ChartData data, _) => data.value,
                // The xValueMapper function maps the category string to the x-axis value, and the yValueMapper
                //function maps the value to the y-axis value. The dataLabelMapper
                // function maps the value to the text that is displayed as the data label on each chart segment.
                dataLabelMapper: (ChartData data, _) =>
                    '${((data.value / _waterGoal) * 100).toStringAsFixed(0)}%',
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ],
            legend: const Legend(isVisible: true),
          ),
          BlurryContainer(
            width: 300.w,
            height: 100.h,
            borderRadius: BorderRadius.circular(18),
            color: Colors.redAccent.withOpacity(0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Display the percentage of the total goal completed
                Text(
                  'Your today goal : ${Watergoal.getdata().get(0)?.addgoal.toString()} ',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                Text(
                  'Add water count :  ${(_waterCount / _waterGoal * 100).toStringAsFixed(0)}%',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),

                const SizedBox(height: 10),
                // Display the percentage of remaining water
                Text(
                  'remaining count :  ${((_waterGoal - _waterCount) / _waterGoal * 100).toStringAsFixed(0)}% ',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ChartData {
  final String category;
  final int value;

  ChartData(this.category, this.value);
}
