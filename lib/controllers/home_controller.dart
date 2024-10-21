import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt currentIndex = 0.obs;
  final RxBool isSelected = false.obs;
  List<String> categories = ['Landmarks', 'Hotels', 'Resturaunts'];

  // devide fetched data to display an
  // appropriate number of places
  // in the home screen
  int devideList(int listLength) {
    double returnValue = 0.0;
    if (listLength <= 15) {
      returnValue = listLength * .5;

      return returnValue.toInt();
    } else {
      returnValue = listLength * .4;

      return returnValue.toInt();
    }
  }
}
