// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 0;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      parcode: fields[1] as String,
      code: fields[0] as String,
      title: fields[2] as String,
      price: fields[3] as String,
      description: fields[4] as String,
      category: fields[5] as String,
      image: fields[6] as String,
      size: fields[7] as String,
      count: fields[8] as int,
      gender: fields[9] as String,
      cart: fields[10] as bool,
      discount: fields[11] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.parcode)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.category)
      ..writeByte(6)
      ..write(obj.image)
      ..writeByte(7)
      ..write(obj.size)
      ..writeByte(8)
      ..write(obj.count)
      ..writeByte(9)
      ..write(obj.gender)
      ..writeByte(10)
      ..write(obj.cart)
      ..writeByte(11)
      ..write(obj.discount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
