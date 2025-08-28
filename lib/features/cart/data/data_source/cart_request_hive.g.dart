// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_request_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartRequestHiveAdapter extends TypeAdapter<CartRequestHive> {
  @override
  final int typeId = 1;

  @override
  CartRequestHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartRequestHive(
      userId: fields[0] as int,
      products: (fields[1] as List).cast<ProductsHive>(),
    );
  }

  @override
  void write(BinaryWriter writer, CartRequestHive obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.products);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartRequestHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
