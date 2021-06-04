import 'package:flutter/material.dart';

import '../screens/activity_details_screen.dart';

class ActivityItem extends StatelessWidget {
  const ActivityItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ActivityDetailsScreen.routeName,
              //pass the argument for the id of the activity here   
              );
          },
          child: Text("Activity name apppear here"),
        ),

      ),
    );
  }
}
