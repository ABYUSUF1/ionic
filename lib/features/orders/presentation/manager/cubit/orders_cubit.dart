import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/features/orders/domain/entity/orders_entity.dart';
import 'package:ionic/features/orders/domain/repo/orders_repo.dart';

part 'orders_state.dart';
part 'orders_cubit.freezed.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepo ordersRepo;
  OrdersCubit(this.ordersRepo) : super(const OrdersState.initial());

  List<OrdersEntity> orders = [];

  Future<void> fetchOrders() async {
    emit(const OrdersState.loading());
    final result = await ordersRepo.fetchOrders();
    result.fold((l) => emit(OrdersState.error(l.errMessage)), (r) {
      orders = r;
      emit(OrdersState.success(orders));
    });
  }

  Future<void> addToOrders(OrdersEntity ordersEntity) async {
    emit(const OrdersState.loading());
    final result = await ordersRepo.addOrder(ordersEntity);
    result.fold((l) => emit(OrdersState.error(l.errMessage)), (_) {
      orders.add(ordersEntity);
      emit(OrdersState.success(orders));
    });
  }
}
