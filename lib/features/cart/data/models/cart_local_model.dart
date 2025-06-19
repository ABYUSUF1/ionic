import 'package:objectbox/objectbox.dart';
import 'cart_product_local_model.dart';

@Entity()
class CartLocalModel {
  @Id()
  int obxId = 0;

  @Backlink('cart')
  final ToMany<CartProductLocalModel> cartProducts =
      ToMany<CartProductLocalModel>();
}
