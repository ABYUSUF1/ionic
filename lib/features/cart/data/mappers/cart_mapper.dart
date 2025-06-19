import 'package:ionic/core/entities/product_item_entity.dart';
import 'package:ionic/core/models/product_item_model.dart';
import 'package:ionic/features/cart/data/models/cart_remote_model.dart';
import 'package:ionic/features/cart/data/models/cart_product_remote_model.dart';

import '../../domain/entity/cart_entity.dart';
import '../../domain/entity/cart_product_entity.dart';
import '../models/cart_local_model.dart';
import '../models/cart_product_local_model.dart';

extension CartProductRemoteMapper on CartProductRemoteModel {
  CartProductEntity toEntity() => CartProductEntity(
    productItem: productItem.toEntity(),
    returnPolicy: returnPolicy,
    quantity: quantity,
  );
}

extension CartProductEntityRemoteMapper on CartProductEntity {
  CartProductRemoteModel toRemote() => CartProductRemoteModel(
    productItem: productItem.toProductItemModel(),
    returnPolicy: returnPolicy,
    quantity: quantity,
  );
}

extension CartRemoteMapper on CartRemoteModel {
  CartEntity toEntity() => CartEntity(
    cartProductsEntity: cartProducts.map((e) => e.toEntity()).toList(),
  );
}

extension CartEntityRemoteMapper on CartEntity {
  CartRemoteModel toRemote() => CartRemoteModel(
    cartProducts: cartProductsEntity.map((e) => e.toRemote()).toList(),
  );
}

extension CartProductLocalToEntity on CartProductLocalModel {
  CartProductEntity toEntity() {
    final product = productItem.target;
    assert(product != null, 'ProductItemModel cannot be null');
    return CartProductEntity(
      productItem: product!.toEntity(),
      returnPolicy: returnPolicy,
      quantity: quantity,
    );
  }
}

extension CartProductEntityToLocal on CartProductEntity {
  CartProductLocalModel toLocal() {
    final model = CartProductLocalModel(
      returnPolicy: returnPolicy,
      quantity: quantity,
    );
    model.productItem.target = productItem.toProductItemModel();
    return model;
  }
}

extension CartLocalToEntity on CartLocalModel {
  CartEntity toEntity() => CartEntity(
    cartProductsEntity:
        cartProducts.map((product) => product.toEntity()).toList(),
  );
}

extension CartEntityToLocal on CartEntity {
  CartLocalModel toLocal() {
    final cartLocal = CartLocalModel();

    final localProducts =
        cartProductsEntity.map((item) => item.toLocal()).toList();

    // The database will handle setting the backlink on each product
    // when this list is saved.
    cartLocal.cartProducts.addAll(localProducts);

    return cartLocal;
  }
}
