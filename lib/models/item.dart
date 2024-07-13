import 'package:timbu_shop2/models/product/product.dart';

class Item {
  final Product product;
  int? quantity;
   Item({
    required this.product,
     this.quantity
   });
}