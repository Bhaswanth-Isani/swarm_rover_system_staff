import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swarm_rover_system_staff/api/orders/orders_api_client.dart';
import 'package:swarm_rover_system_staff/api/orders/orders_api_response.dart';

final ordersProvider =
    StateNotifierProvider<OrdersProvider, List<Order>>(OrdersProvider.new);

class OrdersProvider extends StateNotifier<List<Order>> {
  OrdersProvider(this.ref) : super([]) {
    getOrders();
  }

  final Ref ref;

  Future<void> getOrders() async {
    state = (await OrdersApiClient(Dio(), baseUrl: dotenv.env['PROD_URL']!)
            .getOrder())
        .order;
  }
}
