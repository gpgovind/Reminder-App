import 'dart:developer';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

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
        ? Center(
            child: Image.asset(''))
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
                    color: Colors.white,
                    blur: 1,
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(result.medicinename),
                            Text(result.reason),
                          ],
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(result.medTime),
                            Text(
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
                    color: Colors.white,
                    blur: 1,
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(completedResult.reason),
                        subtitle:  Text(completedResult.medicinename),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(completedResult.medTime),
                            Text(
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
        ? Center(
            child: Image.asset('lib/assets/images/107420-no-data-loader.gif'))
        : ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: matchQuery.length + completedMatchQuery.length,
            itemBuilder: (context, index) {
              if (index < matchQuery.length) {
                var result = matchQuery[index];

                    ValueNotifier<bool> clickToComplete=ValueNotifier(result.isCompleted);
                return BlurryContainer(
                    borderRadius: BorderRadius.circular(30),
                    width: double.infinity,
                    height: 68.h,
                    color: Colors.white,
                    blur: 1,
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(result.medicinename),
                            Text(result.reason)
                          ],
                        ),
                        subtitle: ValueListenableBuilder(
                          valueListenable: clickToComplete,
                          builder: (context,box,_) {
                            return Checkbox(
                              value: result.isCompleted,
                              onChanged: (value) {
                                if (value!) {
                                  log('chekbox is taped');

                                  QuickAlert.show(
                                    onCancelBtnTap: () {
                                      Navigator.of(context).pop();
                                      box=false;
                                        clickToComplete.value = !clickToComplete.value;
                                        clickToComplete.notifyListeners();
                                    },
                                    onConfirmBtnTap: ()async {
                                   
                                      box=false;
                                      clickToComplete.value = !clickToComplete.value;
                                    clickToComplete.notifyListeners();
                                     result.isCompleted = true;
                                        // here we are deleting and storing
                                        // the data when user click on check box
                                        // it marked has completed medicine
                                        // and we will delete that data and store to
                                        // another filed called MedCompleted the reason
                                        // we are storing the data because we want to
                                        // show the completed data in history
                                      MedCompleted med =   await MedCompleted(
                                          result.medicinename,
                                          result.reason,
                                          result.category,
                                          result.medTime,
                                          result.date,
                                        );
                                        MedCompleted.getdata().add(med);
                                        med.save();

                                      await matchQuery[index].delete();
                                         Navigator.of(context).pop();
                                    },
                                    context: context,
                                    type: QuickAlertType.confirm,
                                    title: 'Are you sure you complete Medicine?',
                                  );
                                } else {
                                  box=false;
                                    clickToComplete.value = !clickToComplete.value;
                                    clickToComplete.notifyListeners();
                                }
                              },
                            );
                          }
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(result.medTime),
                            Text(
                              DateFormat("MMMM d").format(result.date),
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
                    color: Colors.white,
                    blur: 1,
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(completedResult.medicinename),
                        subtitle:  Text(completedResult.reason),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(completedResult.medTime),
                            Text(
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
}
