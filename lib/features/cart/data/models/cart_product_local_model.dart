import 'package:objectbox/objectbox.dart';
import '../../../../core/models/product_item_model.dart';
import 'cart_local_model.dart';

@Entity()
class CartProductLocalModel {
  @Id()
  int id = 0;

  final ToOne<ProductItemModel> productItem = ToOne<ProductItemModel>();

  final String returnPolicy;
  final int quantity;

  final ToOne<CartLocalModel> cart = ToOne<CartLocalModel>();

  CartProductLocalModel({required this.returnPolicy, required this.quantity});
}
