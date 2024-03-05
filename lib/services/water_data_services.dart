import '../models/hive_services/data_model.dart';

abstract class WaterServiceData {
  setWaterNumberPickerValue(int value);
  //**** */
  goalRetriever({required final currentValue});
  //**** */
  int displayGoal();
  //**** */
  Future<void> addWater();
  //*** */
  double getIndicatorValue();
  //***** */
  indicatorValueAdd({required double value});
  //***** */
  grap();
  //***** */
  deleteWater(index, List<Drinkbox> data);
}
