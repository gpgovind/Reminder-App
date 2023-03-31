import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../models/hive_services/data_model.dart';
import '../../../utils/water_tile.dart';
import 'package:blurrycontainer/blurrycontainer.dart';

import 'grap_notifier_function.dart';

class WaterListView extends StatefulWidget {
  const WaterListView({super.key});

  @override
  State<WaterListView> createState() => _WaterListViewState();
}

class _WaterListViewState extends State<WaterListView> {
  @override
  void initState() {
    Drinkbox.getdata();
    super.initState();
  }

  bool startAnimation = false;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<Drinkbox>>(
      // listens to changes to a Hive box and rebuilds the UI accordingly.
      valueListenable: Drinkbox.getdata()
          .listenable(), // The box that the widget listens to changes for.
      builder: (context, box, _) {
        final today = DateTime.now(); // Get the current date and time.
        final data1 = box.values
            .where(
                (item) => // Get a list of water intake data for the current day.
                    item.date.year == today.year &&
                    item.date.year == today.year &&
                    item.date.month == today.month &&
                    item.date.day == today.day)
            .toList();
        return SizedBox(
          height: 400, // replace with a fixed height
          child: data1.isEmpty
              ? _buildEmptyState()
              : ListView.separated(
                  separatorBuilder: (_, index) => const SizedBox(
                    height: 10,
                  ),
                  //condition for empty or not
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap:
                      true, // Set this to true to make the ListView take up only as much space as it needs.
                  reverse: true,
                  itemCount: data1.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      onDismissed: (direction) async {
                        // Remove the item from the list

                        await Drinkbox.getdata().deleteAt(index);
                        await grap(Drinkbox.getdata(), DateTime.now());
                      },
                      key: UniqueKey(),
                      child: BlurryContainer(
                        borderRadius: BorderRadius.circular(30),
                        width: double.infinity,
                        height: 68.h,
                        color: const Color(0xFF35BAFF).withOpacity(0.8),
                        blur: 1,
                        elevation: 2,
                        child: WaterTile(
                          date: data1[index].date,
                          time: data1[index].time.toString(),
                          ml: data1[index].addWater.toString(),
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    //  if there is no data on that current date it wil show this image
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.hourglass_empty_rounded),
          Center(
              child: Text(
            'Empty please add drink!!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          )),
        ],
      ),
    );
  }
}
