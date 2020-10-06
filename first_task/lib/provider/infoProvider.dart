import 'package:first_task/api/getInfoApi.dart';
import 'package:flutter/cupertino.dart';

import '../model.dart';

class infoProvider with ChangeNotifier {
  getInfoApi getApi = getInfoApi();
  model information;
  bool isloading = true;
  infoProvider() {
    Future<model> response = getApi.getData();
    response.then((value) {
      information = value;
      isloading = false;
      notifyListeners();
    });
  }
}
