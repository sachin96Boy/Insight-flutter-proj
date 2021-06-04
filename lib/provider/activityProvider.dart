import 'package:flutter/foundation.dart';

import './activites.dart';

class ActivityProvider with ChangeNotifier {
  List<Activities> _activites = [
    Activities(
        id: 's1',
        title: 'wor new web',
        description: 'Add a new section to webpage',
        startDate: '2020-05-12',
        endDate: '2020-05-31',
        author: 'sachin',
        status: Status.Todo),
  ];

  ActivityProvider(this._activites);

  List<Activities> getActivities{
    return [..._activites];
  }

  
}
