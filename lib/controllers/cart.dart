import 'package:get/get.dart';

import '../models/item.dart';

class CartController extends GetxController{
List<Item> cartItems = [];
int checkoutStage = 0;
changeCheckoutStage(int i){
  checkoutStage = i;
  update();
}
}