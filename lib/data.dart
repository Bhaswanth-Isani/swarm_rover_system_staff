class Orders {
  Orders({
    required this.room,
    required this.order,
  });

  final int room;
  final List<Item> order;
}

class Item {
  Item({required this.name, required this.asset, required this.delivery});

  final String name;
  final String asset;
  final bool delivery;
}

final orders = [
  Orders(
    room: 412,
    order: [
      Item(name: 'Burger', asset: 'assets/burger.png', delivery: false),
      Item(name: 'Soap', asset: 'assets/soap.png', delivery: true),
    ],
  ),
];
