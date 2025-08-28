// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductsHiveAdapter extends TypeAdapter<ProductsHive> {
  @override
  final int typeId = 0;

  @override
  ProductsHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductsHive(
      id: fields[0] as int,
      quantity: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ProductsHive obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductsHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
