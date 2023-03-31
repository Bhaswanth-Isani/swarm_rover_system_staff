import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:swarm_rover_system_staff/api/orders/orders_api_response.dart';

part 'orders_api_client.g.dart';

@RestApi()
abstract class OrdersApiClient {
  factory OrdersApiClient(Dio dio, {required String baseUrl}) =
      _OrdersApiClient;

  @GET('/hotel/get-orders')
  @Headers({'Content-Type': 'application/json'})
  Future<OrdersResponse> getOrder();
}
