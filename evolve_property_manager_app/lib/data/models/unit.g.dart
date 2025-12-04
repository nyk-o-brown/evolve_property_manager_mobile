// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Unit _$UnitFromJson(Map<String, dynamic> json) => Unit(
  id: (json['id'] as num).toInt(),
  propertyId: (json['property_id'] as num).toInt(),
  unitNumber: json['unit_number'] as String,
  rentPrice: (json['rent_price'] as num).toDouble(),
  tenantId: (json['tenant_id'] as num?)?.toInt(),
  status: json['status'] as String,
  imageUrl: json['image_url'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$UnitToJson(Unit instance) => <String, dynamic>{
  'id': instance.id,
  'property_id': instance.propertyId,
  'unit_number': instance.unitNumber,
  'rent_price': instance.rentPrice,
  'tenant_id': instance.tenantId,
  'status': instance.status,
  'image_url': instance.imageUrl,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
