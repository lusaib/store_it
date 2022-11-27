// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_sub_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategorySubItemsModel _$$_CategorySubItemsModelFromJson(
        Map<String, dynamic> json) =>
    _$_CategorySubItemsModel(
      id: json['id'] as String,
      item: json['item'] as String,
      value: json['value'] as String,
      desc: json['desc'] as String? ?? "",
      position: json['position'] as int,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$$_CategorySubItemsModelToJson(
        _$_CategorySubItemsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item': instance.item,
      'value': instance.value,
      'desc': instance.desc,
      'position': instance.position,
      'createdDate': instance.createdDate?.toIso8601String(),
    };
