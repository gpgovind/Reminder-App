import 'dart:developer';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:water_reminder/provider/medicine_provider.dart';
import '../../../models/hive_services/data_model.dart';

class Search extends SearchDelegate {
  // Get data from the MedicinesAdd and MedCompleted database

  List<MedicinesAdd> allData = MedicinesAdd.getdata().values.toList();
  List<MedCompleted> competedData = MedCompleted.getdata().values.toList();

  // Build the search bar action
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  // Build the back button
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, "search result");
        },
        icon: const Icon(Icons.arrow_back));
  }

// Build the suggested search results
  @override
  Widget buildSuggestions(BuildContext context) {
    // Create empty lists to store matches

    List<MedicinesAdd> matchQuery = [];
    List<MedCompleted> completedMatchQuery = [];

    // Loop through allData and competedData to find matches

    for (var item in allData) {
      //if conditions are used to filter the data based on the search query entered by the user.
      //The toLowerCase() method is used to convert the strings to lowercase, making it case-insensitive.
      // The contains() method is used to check if
      //the search query matches any part of the medicinename or reason fields of the MedicinesAdd and MedCompleted objects.
      if (item.medicinename
              .toLowerCase()
              .contains(query.toLowerCase().trim()) ||
          item.reason.toLowerCase().contains(query.toLowerCase().trim())) {
        matchQuery.add(item);
      }
    }
    for (var item in competedData) {
      if (item.medicinename
              .toLowerCase()
              .contains(query.toLowerCase().trim()) ||
          item.reason.toLowerCase().contains(query.toLowerCase().trim())) {
        completedMatchQuery.add(item);
      }
    }

    // Return either a loader or the search results
    return (matchQuery.isEmpty && completedMatchQuery.isEmpty)
        ? const Center(child: Text('is empty'))
        : ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: matchQuery.length + completedMatchQuery.length,
            itemBuilder: (context, index) {
              //if condition if (index < matchQuery.length)
              //is used to determine if the current index of the ListView.builder
              //is within the range of the matchQuery list.
              if (index < matchQuery.length) {
                var result = matchQuery[index];

                //If the condition is true, it means that the current item being built
                //in the ListView.builder corresponds to an item in the matchQuery list,
                // so it extracts the corresponding MedicinesAdd object from the matchQuery
                //list using the index and assigns it to the variable result.
                return BlurryContainer(
                    borderRadius: BorderRadius.circular(30),
                    width: double.infinity,
                    height: 68.h,
                    color: Colors.green.withOpacity(0.5),
                    blur: 1,
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(result.medicinename,
                                style: const TextStyle(
                                   color: Colors.white,
                                  fontSize: 18,
                                )),
                            Text(result.reason,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                )),
                          ],
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(result.medTime,
                                style: const TextStyle(
                                   color: Colors.white,
                                  fontSize: 15,
                                )),
                            Text(
                              style: const TextStyle(
                                 color: Colors.white,
                                fontSize: 15,
                              ),
                              DateFormat("MMMM d").format(result.date),
                            ),
                          ],
                        ),
                      ),
                    ));
                //If the condition is false, it means that the current item being built
                // corresponds to an item in the completedMatchQuery list, so it extracts
                //the corresponding MedCompleted object from the completedMatchQuery
                //list using the index and subtracting the length of matchQuery from it,
                //and assigns it to the variable completedResult.
              } else {
                var completedResult =
                    completedMatchQuery[index - matchQuery.length];
                return BlurryContainer(
                    borderRadius: BorderRadius.circular(30),
                    width: double.infinity,
                    height: 68.h,
                    color: Colors.green.withOpacity(0.5),
                    blur: 1,
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(completedResult.reason,
                            style: const TextStyle(
                               color: Colors.white,
                              fontSize: 18,
                            )),
                        subtitle: Text(completedResult.medicinename,
                            style: const TextStyle(
                               color: Colors.white,
                              fontSize: 16,
                            )),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                                style: const TextStyle(
                                  fontSize: 15,
                                   color: Colors.white,
                                ),
                                completedResult.medTime),
                            Text(
                              style: const TextStyle(
                                fontSize: 15,
                                 color: Colors.white,
                              ),
                              DateFormat("MMMM d").format(completedResult.date),
                            ),
                          ],
                        ),
                      ),
                    ));
              }
            },
          );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Create empty lists to store matches
    List<MedicinesAdd> matchQuery = [];
    List<MedCompleted> completedMatchQuery = [];
    // Loop through allData and completedData to find matches
    for (var item in allData) {
      if (item.medicinename
              .toLowerCase()
              .contains(query.toLowerCase().trim()) ||
          item.reason.toLowerCase().contains(query.toLowerCase().trim())) {
        matchQuery.add(item);
      }
    }
    for (var item in competedData) {
      if (item.medicinename
              .toLowerCase()
              .contains(query.toLowerCase().trim()) ||
          item.reason.toLowerCase().contains(query.toLowerCase().trim())) {
        completedMatchQuery.add(item);
      }
    }

    // Return either a loader or the search results
    return (matchQuery.isEmpty && completedMatchQuery.isEmpty)
        ? const Center(child: Text('is empty'))
        : ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: matchQuery.length + completedMatchQuery.length,
            itemBuilder: (context, index) {
              if (index < matchQuery.length) {
                var result = matchQuery[index];

                bool clickToComplete = result.isCompleted;
                return BlurryContainer(
                    borderRadius: BorderRadius.circular(30),
                    width: double.infinity,
                    height: 68.h,
                    color: Colors.green.withOpacity(0.5),
                    blur: 1,
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(result.medicinename,
                                style: const TextStyle(
                                  fontSize: 18,
                                   color: Colors.white,
                                )),
                            Text(result.reason,
                                style: const TextStyle(
                                  fontSize: 17,
                                   color: Colors.white,
                                ))
                          ],
                        ),
                        subtitle: Consumer<MedicineProvider>(
                            builder: (context, medicineProvider, _) {
                          return Checkbox(
                            value: clickToComplete,
                            onChanged: (value) {
                              clickToComplete = value!;
                              if (value == true) {
                                log('chekbox is taped');

                                QuickAlert.show(
                                  onCancelBtnTap: () {
                                    Navigator.of(context).pop();
                                    value = false;
                                  },
                                  onConfirmBtnTap: () async {
                                    value = false;
                                    Navigator.of(context).pop();
                                    // here we are deleting and storing
                                    // the data when user click on check box
                                    // it marked has completed medicine
                                    // and we will delete that data and store to
                                    // another filed called MedCompleted the reason
                                    // we are storing the data because we want to
                                    // show the completed data in history
                                    context
                                        .read<MedicineProvider>()
                                        .medCompleted(
                                            medicineName: result.medicinename,
                                            reason: result.reason,
                                            category: result.category,
                                            medTime: result.medTime,
                                            medDate: result.date);

                                    await matchQuery[index].delete();
                                  },
                                  context: context,
                                  type: QuickAlertType.confirm,
                                  title: 'Are you sure you complete Medicine?',
                                );
                              }
                            },
                          );
                        }),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(result.medTime,
                                style: const TextStyle(fontSize: 15,
                                 color: Colors.white,
                                )),
                            Text(
                              DateFormat("MMMM d").format(result.date),
                              style: const TextStyle(
                                fontSize: 15,
                                 color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
              } else {
                var completedResult =
                    completedMatchQuery[index - matchQuery.length];
                return BlurryContainer(
                    borderRadius: BorderRadius.circular(30),
                    width: double.infinity,
                    height: 68.h,
                    color: Colors.green.withOpacity(0.5),
                    blur: 1,
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(completedResult.medicinename,
                            style: const TextStyle(fontSize: 18,
                             color: Colors.white,)),
                        subtitle: Text(completedResult.reason,
                            style: const TextStyle(fontSize: 18,
                             color: Colors.white,)),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(completedResult.medTime,
                                style: const TextStyle(fontSize: 15,
                                 color: Colors.white,)),
                            Text(
                              DateFormat("MMMM d").format(completedResult.date),
                              style: const TextStyle(fontSize: 15,
                               color: Colors.white,),
                            ),
                          ],
                        ),
                      ),
                    ));
              }
            },
          );
  }
}
