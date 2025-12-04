// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Property _$PropertyFromJson(Map<String, dynamic> json) => Property(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  address: json['address'] as String,
  city: json['city'] as String,
  state: json['state'] as String,
  zipCode: json['zip_code'] as String,
  totalUnits: (json['total_units'] as num).toInt(),
  monthlyIncome: (json['monthly_income'] as num).toDouble(),
  imageUrl: json['image_url'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$PropertyToJson(Property instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'address': instance.address,
  'city': instance.city,
  'state': instance.state,
  'zip_code': instance.zipCode,
  'total_units': instance.totalUnits,
  'monthly_income': instance.monthlyIncome,
  'image_url': instance.imageUrl,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
