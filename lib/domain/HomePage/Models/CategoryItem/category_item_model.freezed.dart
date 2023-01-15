// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryItemModel _$CategoryItemModelFromJson(Map<String, dynamic> json) {
  return _CategoryItemModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryItemModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdDate => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get modifiedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryItemModelCopyWith<CategoryItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryItemModelCopyWith<$Res> {
  factory $CategoryItemModelCopyWith(
          CategoryItemModel value, $Res Function(CategoryItemModel) then) =
      _$CategoryItemModelCopyWithImpl<$Res, CategoryItemModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String desc,
      String? password,
      int position,
      @TimestampConverter() DateTime createdDate,
      @TimestampConverter() DateTime modifiedDate});
}

/// @nodoc
class _$CategoryItemModelCopyWithImpl<$Res, $Val extends CategoryItemModel>
    implements $CategoryItemModelCopyWith<$Res> {
  _$CategoryItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? desc = null,
    Object? password = freezed,
    Object? position = null,
    Object? createdDate = null,
    Object? modifiedDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modifiedDate: null == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryItemModelCopyWith<$Res>
    implements $CategoryItemModelCopyWith<$Res> {
  factory _$$_CategoryItemModelCopyWith(_$_CategoryItemModel value,
          $Res Function(_$_CategoryItemModel) then) =
      __$$_CategoryItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String desc,
      String? password,
      int position,
      @TimestampConverter() DateTime createdDate,
      @TimestampConverter() DateTime modifiedDate});
}

/// @nodoc
class __$$_CategoryItemModelCopyWithImpl<$Res>
    extends _$CategoryItemModelCopyWithImpl<$Res, _$_CategoryItemModel>
    implements _$$_CategoryItemModelCopyWith<$Res> {
  __$$_CategoryItemModelCopyWithImpl(
      _$_CategoryItemModel _value, $Res Function(_$_CategoryItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? desc = null,
    Object? password = freezed,
    Object? position = null,
    Object? createdDate = null,
    Object? modifiedDate = null,
  }) {
    return _then(_$_CategoryItemModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modifiedDate: null == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategoryItemModel implements _CategoryItemModel {
  _$_CategoryItemModel(
      {required this.id,
      required this.title,
      this.desc = "",
      this.password,
      required this.position,
      @TimestampConverter() required this.createdDate,
      @TimestampConverter() required this.modifiedDate});

  factory _$_CategoryItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryItemModelFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  @JsonKey()
  final String desc;
  @override
  final String? password;
  @override
  final int position;
  @override
  @TimestampConverter()
  final DateTime createdDate;
  @override
  @TimestampConverter()
  final DateTime modifiedDate;

  @override
  String toString() {
    return 'CategoryItemModel(id: $id, title: $title, desc: $desc, password: $password, position: $position, createdDate: $createdDate, modifiedDate: $modifiedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.modifiedDate, modifiedDate) ||
                other.modifiedDate == modifiedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, desc, password,
      position, createdDate, modifiedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryItemModelCopyWith<_$_CategoryItemModel> get copyWith =>
      __$$_CategoryItemModelCopyWithImpl<_$_CategoryItemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryItemModelToJson(
      this,
    );
  }
}

abstract class _CategoryItemModel implements CategoryItemModel {
  factory _CategoryItemModel(
          {required final String id,
          required final String title,
          final String desc,
          final String? password,
          required final int position,
          @TimestampConverter() required final DateTime createdDate,
          @TimestampConverter() required final DateTime modifiedDate}) =
      _$_CategoryItemModel;

  factory _CategoryItemModel.fromJson(Map<String, dynamic> json) =
      _$_CategoryItemModel.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get desc;
  @override
  String? get password;
  @override
  int get position;
  @override
  @TimestampConverter()
  DateTime get createdDate;
  @override
  @TimestampConverter()
  DateTime get modifiedDate;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryItemModelCopyWith<_$_CategoryItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
