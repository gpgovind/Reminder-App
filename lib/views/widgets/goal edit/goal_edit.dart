import 'package:flutter/material.dart';

import '../../dialogs/notification/notification.dart';

class GoalEdit extends StatelessWidget {
  const GoalEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        goalEdit(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.edit,
            color: Colors.blue,
          ),
          Text('Edit goal')
        ],
      ),
    );
  }
}
