import 'package:get/get.dart';

class HomeController extends GetxController{
  int selectedTab = 0;
  changeTab(int v){
    selectedTab = v;
    update();
  }
  @override
  void onInit() {
    selectedTab.obs;
    super.onInit();
  }
}