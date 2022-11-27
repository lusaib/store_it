// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category_sub_items_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategorySubItemsModel _$CategorySubItemsModelFromJson(
    Map<String, dynamic> json) {
  return _CategorySubItemsModel.fromJson(json);
}

/// @nodoc
mixin _$CategorySubItemsModel {
  String get id => throw _privateConstructorUsedError;
  String get item => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  DateTime? get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategorySubItemsModelCopyWith<CategorySubItemsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategorySubItemsModelCopyWith<$Res> {
  factory $CategorySubItemsModelCopyWith(CategorySubItemsModel value,
          $Res Function(CategorySubItemsModel) then) =
      _$CategorySubItemsModelCopyWithImpl<$Res, CategorySubItemsModel>;
  @useResult
  $Res call(
      {String id,
      String item,
      String value,
      String desc,
      int position,
      DateTime? createdDate});
}

/// @nodoc
class _$CategorySubItemsModelCopyWithImpl<$Res,
        $Val extends CategorySubItemsModel>
    implements $CategorySubItemsModelCopyWith<$Res> {
  _$CategorySubItemsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? item = null,
    Object? value = null,
    Object? desc = null,
    Object? position = null,
    Object? createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategorySubItemsModelCopyWith<$Res>
    implements $CategorySubItemsModelCopyWith<$Res> {
  factory _$$_CategorySubItemsModelCopyWith(_$_CategorySubItemsModel value,
          $Res Function(_$_CategorySubItemsModel) then) =
      __$$_CategorySubItemsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String item,
      String value,
      String desc,
      int position,
      DateTime? createdDate});
}

/// @nodoc
class __$$_CategorySubItemsModelCopyWithImpl<$Res>
    extends _$CategorySubItemsModelCopyWithImpl<$Res, _$_CategorySubItemsModel>
    implements _$$_CategorySubItemsModelCopyWith<$Res> {
  __$$_CategorySubItemsModelCopyWithImpl(_$_CategorySubItemsModel _value,
      $Res Function(_$_CategorySubItemsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? item = null,
    Object? value = null,
    Object? desc = null,
    Object? position = null,
    Object? createdDate = freezed,
  }) {
    return _then(_$_CategorySubItemsModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategorySubItemsModel implements _CategorySubItemsModel {
  _$_CategorySubItemsModel(
      {required this.id,
      required this.item,
      required this.value,
      this.desc = "",
      required this.position,
      this.createdDate});

  factory _$_CategorySubItemsModel.fromJson(Map<String, dynamic> json) =>
      _$$_CategorySubItemsModelFromJson(json);

  @override
  final String id;
  @override
  final String item;
  @override
  final String value;
  @override
  @JsonKey()
  final String desc;
  @override
  final int position;
  @override
  final DateTime? createdDate;

  @override
  String toString() {
    return 'CategorySubItemsModel(id: $id, item: $item, value: $value, desc: $desc, position: $position, createdDate: $createdDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategorySubItemsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, item, value, desc, position, createdDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategorySubItemsModelCopyWith<_$_CategorySubItemsModel> get copyWith =>
      __$$_CategorySubItemsModelCopyWithImpl<_$_CategorySubItemsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategorySubItemsModelToJson(
      this,
    );
  }
}

abstract class _CategorySubItemsModel implements CategorySubItemsModel {
  factory _CategorySubItemsModel(
      {required final String id,
      required final String item,
      required final String value,
      final String desc,
      required final int position,
      final DateTime? createdDate}) = _$_CategorySubItemsModel;

  factory _CategorySubItemsModel.fromJson(Map<String, dynamic> json) =
      _$_CategorySubItemsModel.fromJson;

  @override
  String get id;
  @override
  String get item;
  @override
  String get value;
  @override
  String get desc;
  @override
  int get position;
  @override
  DateTime? get createdDate;
  @override
  @JsonKey(ignore: true)
  _$$_CategorySubItemsModelCopyWith<_$_CategorySubItemsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
