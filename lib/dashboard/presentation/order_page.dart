import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swarm_rover_system_staff/api/orders/orders_api_response.dart';
import 'package:swarm_rover_system_staff/dashboard/orders_provider.dart';

class OrderPage extends ConsumerStatefulWidget {
  const OrderPage({super.key, required this.index});

  final int index;

  @override
  ConsumerState<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends ConsumerState<OrderPage> {
  @override
  void initState() {
    super.initState();
    ref.read(ordersProvider.notifier).getOrders();
  }

  @override
  Widget build(BuildContext context) {
    final order = ref.watch(ordersProvider)[widget.index];

    return Scaffold(
      appBar: AppBar(
        title: Text('Orders for Room ${widget.index + 1}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView.builder(
          itemBuilder: (context, item) {
            return Container(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                title: Text(order.items[item].itemName),
                leading: Image.asset(
                  order.items[item].itemName == 'Salad'
                      ? 'assets/salad.png'
                      : 'assets/burger.png',
                ),
                subtitle: const Text('NOT DELIVERED'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () => null,
                      child: const Text('Rover 1'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () => null,
                      child: const Text('Rover 2'),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: order.items.length,
        ),
      ),
    );
  }
}
