// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimestampConverter _$TimestampConverterFromJson(Map<String, dynamic> json) =>
    TimestampConverter();

Map<String, dynamic> _$TimestampConverterToJson(TimestampConverter instance) =>
    <String, dynamic>{};

_$_CategoryItemModel _$$_CategoryItemModelFromJson(Map<String, dynamic> json) =>
    _$_CategoryItemModel(
      id: json['id'] as String,
      title: json['title'] as String,
      desc: json['desc'] as String? ?? "",
      password: json['password'] as String?,
      position: json['position'] as int,
      createdDate:
          const TimestampConverter().fromJson(json['createdDate'] as Timestamp),
      modifiedDate: const TimestampConverter()
          .fromJson(json['modifiedDate'] as Timestamp),
    );

Map<String, dynamic> _$$_CategoryItemModelToJson(
        _$_CategoryItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'desc': instance.desc,
      'password': instance.password,
      'position': instance.position,
      'createdDate': const TimestampConverter().toJson(instance.createdDate),
      'modifiedDate': const TimestampConverter().toJson(instance.modifiedDate),
    };
