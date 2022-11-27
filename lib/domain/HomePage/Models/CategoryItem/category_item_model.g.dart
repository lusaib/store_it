// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryItemModel _$$_CategoryItemModelFromJson(Map<String, dynamic> json) =>
    _$_CategoryItemModel(
      id: json['id'] as String,
      title: json['title'] as String,
      desc: json['desc'] as String? ?? "",
      password: json['password'] as String?,
      subItems: (json['subItems'] as List<dynamic>?)
              ?.map((e) =>
                  CategorySubItemsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      position: json['position'] as int,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$$_CategoryItemModelToJson(
        _$_CategoryItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'desc': instance.desc,
      'password': instance.password,
      'subItems': instance.subItems,
      'position': instance.position,
      'createdDate': instance.createdDate?.toIso8601String(),
    };
