// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      id: json['id'] as String,
      itemName: json['itemName'] as String,
      itemPrice: json['itemPrice'] as int,
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'id': instance.id,
      'itemName': instance.itemName,
      'itemPrice': instance.itemPrice,
    };

_$_Order _$$_OrderFromJson(Map<String, dynamic> json) => _$_Order(
      items: (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'items': instance.items,
    };

_$_OrdersResponse _$$_OrdersResponseFromJson(Map<String, dynamic> json) =>
    _$_OrdersResponse(
      success: json['success'] as bool,
      order: (json['order'] as List<dynamic>)
          .map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_OrdersResponseToJson(_$_OrdersResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'order': instance.order,
    };
